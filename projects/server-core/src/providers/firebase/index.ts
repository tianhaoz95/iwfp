import * as admin from "firebase-admin";
import { ServiceProvider } from "../base";
import {
  CreditCardCreationRequest,
  CreditCardUpdateRequest,
  CreditCardRemovalRequest,
  CreditCardFetchRequest,
  PromotionAdditionRequest,
  PromotionRemovalRequest,
  PromotionUpdateRequest,
  UserRemovalRequest,
  HttpBasedCredential,
  CreditCard,
  Promotion,
} from "../../interfaces";
import fs from "fs";
import { LoggingCallback } from "../../types";

export class FirebaseServiceProvider extends ServiceProvider {
  app: admin.app.App | undefined;
  authenticated: boolean;
  authUid: string;
  logger: LoggingCallback;

  constructor(logger: LoggingCallback) {
    super();
    this.authenticated = false;
    this.authUid = "unknown";
    this.logger = logger;
    let projectId = "unknown";
    let clientEmail = "unknown";
    let privateKey = "unknown";
    if (
      process.env["FB_PROJECT_ID"] &&
      process.env["FB_CLIENT_EMAIL"] &&
      process.env["FB_PRIVATE_KEY"]
    ) {
      projectId = process.env["FB_PROJECT_ID"];
      clientEmail = process.env["FB_CLIENT_EMAIL"];
      privateKey = process.env["FB_PRIVATE_KEY"];
    } else if (process.env["FB_PROJECT_CRED_LOCATION"]) {
      const projectCredLocation = process.env["FB_PROJECT_CRED_LOCATION"];
      const credContent = fs.readFileSync(projectCredLocation, "utf-8");
      const parsedCred = JSON.parse(credContent);
      logger(`Parsed credentials success.`, "info");
      if (
        parsedCred["project_id"] &&
        parsedCred["client_email"] &&
        parsedCred["private_key"]
      ) {
        projectId = parsedCred["project_id"];
        clientEmail = parsedCred["client_email"];
        privateKey = parsedCred["private_key"];
      } else {
        throw Error(
          "Error: Credential missing from the credential file. " +
            "Please set FB_PROJECT_CRED_LOCATION to the absolute " +
            "path to the service account credential JSON file."
        );
      }
    } else {
      throw Error("Firebase credentials missing.");
    }
    if (admin.apps.length === 0) {
      const cred: admin.credential.Credential = admin.credential.cert({
        projectId,
        clientEmail,
        privateKey,
      });
      logger(`Use project ID: ${projectId}`, "info");
      this.app = admin.initializeApp(
        {
          projectId: projectId,
          credential: cred,
        },
        "vercel-server"
      );
    } else {
      logger("Firebase already initialized. Skip.", "info");
    }
    if (!this.app) {
      this.app = admin.app("vercel-server");
    }
  }

  async getUserRef(
    userId: string
  ): Promise<
    FirebaseFirestore.DocumentReference<FirebaseFirestore.DocumentData>
  > {
    if (this.app) {
      const ref = this.app
        .firestore()
        .collection("channel")
        .doc("production-v1")
        .collection("users")
        .doc(userId);
      const user_space = await ref.get();
      if (!user_space.exists) {
        await this.app
          .firestore()
          .collection("channel")
          .doc("production-v1")
          .set({ created_at: "test" });
        await this.app
          .firestore()
          .collection("channel")
          .doc("production-v1")
          .collection("users")
          .doc(userId)
          .set({ created_at: "test" });
      }
      return ref;
    } else {
      this.logger("Firebase app not created.", "error");
      throw Error("Firebase app not created.");
    }
  }

  requiresAsyncInitialization(): boolean {
    return false;
  }

  async initialize(credential: HttpBasedCredential): Promise<void> {
    await this.authenticate(credential);
  }

  sanityCheck(): Promise<void> {
    throw new Error("Method not implemented.");
  }

  async authenticate(credential: HttpBasedCredential): Promise<void> {
    if (process.env["FIREBASE_TEST_USERNAME"]) {
      this.logger(`User username override set by FIREBASE_TEST_USERNAME: ${process.env["FIREBASE_TEST_USERNAME"]}`, "info");
      this.authUid = process.env["FIREBASE_TEST_USERNAME"];
    } else {
      this.logger("Use the credentials in the request.", "info");
      if (this.app) {
        const verifyResult = await this.app
          .auth()
          .verifyIdToken(credential.token);
        this.authUid = verifyResult.uid;
        this.logger(`Credential verified with UID: ${this.authUid}.`, "info");
      } else {
        this.logger("The credentials cannot be verified. Abort.", "info");
        throw Error("Firebase app not created.");
      }
    }
  }

  async addCreditCard(req: CreditCardCreationRequest): Promise<void> {
    this.logger("Execute add credit card in Firebase.", "info");
    if (req.cardData && req.cardData.id) {
      const userId: string = this.authUid;
      const userRef = await this.getUserRef(userId);
      const cardRef = userRef.collection("cards").doc(req.cardData.id);
      this.logger(`Check card under username ${userId} with ID ${req.cardData.id} (from request).`, "info");
      const cardSnap = await cardRef.get();
      if (!cardSnap.exists) {
        const cardData: CreditCard = CreditCard.fromObject(req.cardData);
        await cardRef.set(cardData.toJSON());
      } else {
        throw Error("Card already exist.");
      }
    } else {
      throw Error("Card data missing or incomplete.");
    }
  }

  async removeCreditCard(req: CreditCardRemovalRequest): Promise<void> {
    if (req.cardId) {
      const userId: string = this.authUid;
      const userRef = await this.getUserRef(userId);
      const cardRef = userRef.collection("cards").doc(req.cardId);
      const cardSnap = await cardRef.get();
      if (cardSnap.exists) {
        await cardRef.delete();
      } else {
        throw Error("Card not exist.");
      }
    } else {
      throw Error("Card data missing or incomplete.");
    }
  }

  async updateCreditCard(req: CreditCardUpdateRequest): Promise<void> {
    this.logger("Execute update credit card in Firebase.", "info");
    if (req.updatedCardData && req.updatedCardData.id) {
      const userId: string = this.authUid;
      const userRef = await this.getUserRef(userId);
      const cardRef = userRef.collection("cards").doc(req.updatedCardData.id);
      const cardSnap = await cardRef.get();
      if (cardSnap.exists) {
        const cardData: CreditCard = CreditCard.fromObject(req.updatedCardData);
        await cardRef.set(cardData.toJSON());
      } else {
        throw Error("Card already exist.");
      }
    } else {
      throw Error("Card data missing or incomplete.");
    }
  }

  async fetchCreditCards(req: CreditCardFetchRequest): Promise<CreditCard[]> {
    const userRef = await this.getUserRef(this.authUid);
    const cardsRef = userRef.collection("cards");
    const cardSnap: FirebaseFirestore.QuerySnapshot = await cardsRef.get();
    const cards: CreditCard[] = [];
    for (const cardDoc of cardSnap.docs) {
      const card: CreditCard = CreditCard.fromObject(cardDoc.data() as FirebaseFirestore.DocumentData);
      cards.push(card);
    }
    return cards;
  }

  async addPromotion(req: PromotionAdditionRequest): Promise<void> {
    if (req.promotionData) {
      const cardId = req.targetCardId;
      const userRef = await this.getUserRef(this.authUid);
      const cardRef = userRef.collection("cards").doc(cardId);
      const cardData = await cardRef.get();
      if (cardData.exists) {
        const card: CreditCard = CreditCard.fromObject(cardData.data() as FirebaseFirestore.DocumentData);
        card.promotions.push(req.promotionData)
        await cardRef.set(card.toJSON());
      } else {
        throw Error("Card not exist.");
      }
    } else {
      throw Error("Promotion data not exist.");
    }
  }

  async removePromition(req: PromotionRemovalRequest): Promise<void> {
    this.logger(`Promotion removing request: ${JSON.stringify(req.toJSON())}`, "info");
    if (req.targetCardId && req.targetPromotionId) {
      const cardId = req.targetCardId;
      const userRef = await this.getUserRef(this.authUid);
      const cardRef = userRef.collection("cards").doc(cardId);
      this.logger(`Check card under username ${this.authUid} with ID ${cardId}.`, "info");
      const cardData = await cardRef.get();
      if (cardData.exists) {
        this.logger(`Card data: ${JSON.stringify(cardData.data())}`, "info");
        const card: CreditCard = CreditCard.fromObject(cardData.data() as FirebaseFirestore.DocumentData);
        this.logger(`Before removing promotion: ${JSON.stringify(card.toJSON())}`, "info");
        card.promotions = card.promotions.filter((promo) => promo.id !== req.targetPromotionId);
        this.logger(`After removing promotion: ${JSON.stringify(card.toJSON())}`, "info");
        await cardRef.set(card.toJSON());
      } else {
        throw Error("Card not exist.");
      }
    } else {
      throw Error("Promotion data not exist.");
    }
  }

  async updatePromotion(req: PromotionUpdateRequest): Promise<void> {
    if (req.targetCardId && req.updatedPromotionData) {
      const cardId = req.targetCardId;
      const userRef = await this.getUserRef(this.authUid);
      const cardRef = userRef.collection("cards").doc(cardId);
      const cardData = await cardRef.get();
      if (cardData.exists) {
        const card = CreditCard.fromObject(cardData.data);
        card.promotions = card.promotions.filter((promo) => promo.id !== req.updatedPromotionData?.id);
        card.promotions.push(req.updatedPromotionData);
        await cardRef.set(card.toJSON());
      } else {
        throw Error("Card not exist.");
      }
    } else {
      throw Error("Promotion data not exist.");
    }
  }

  async removeUser(req: UserRemovalRequest): Promise<void> {
    const userRef = await this.getUserRef(req.username);
    await userRef.delete();
    await this.app?.auth().deleteUser(req.username);
  }
}
