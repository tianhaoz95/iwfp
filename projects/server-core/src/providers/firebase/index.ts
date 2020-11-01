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
          // databaseURL: "https://iwfpapp.firebaseio.com",
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
    if (process.env["FIREBASE_AUTH_EMULATOR_HOST"]) {
      this.authUid = "test_user_uid";
    } else {
      if (this.app) {
        const verifyResult = await this.app
          .auth()
          .verifyIdToken(credential.token);
        this.authUid = verifyResult.uid;
      } else {
        throw Error("Firebase app not created.");
      }
    }
  }

  async addCreditCard(req: CreditCardCreationRequest): Promise<void> {
    this.logger("Execute add credit card in Firebase.", "info");
    if (req.cardData && req.cardData.id) {
      this.logger("Card data and id found.", "info");
      const userId: string = this.authUid;
      this.logger("Got user ID.", "info");
      const userRef = await this.getUserRef(userId);
      this.logger("Created user reference.", "info");
      const cardRef = userRef.collection("cards").doc(req.cardData.id);
      this.logger("Created card reference.", "info");
      const cardSnap = await cardRef.get();
      this.logger(
        `Retrieved card snapshot => existence: ${
          cardSnap.exists
        }, data: ${JSON.stringify(cardSnap.data())}`,
        "info"
      );
      if (cardSnap.data() === undefined) {
        this.logger("Card not exist. Procceed.", "info");
        const cardData: CreditCard = CreditCard.fromObject(req.cardData);
        await cardRef.set(cardData.toJSON());
        this.logger("Card data set. Done.", "info");
      } else {
        this.logger("Card already exist", "error");
        throw Error("Card already exist.");
      }
    } else {
      throw Error("Card data missing or incomplete.");
    }
  }
  removeCreditCard(req: CreditCardUpdateRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  updateCreditCard(req: CreditCardRemovalRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  async fetchCreditCards(req: CreditCardFetchRequest): Promise<CreditCard[]> {
    const userRef = await this.getUserRef(this.authUid);
    const cardsRef = userRef.collection("cards");
    const cardSnap: FirebaseFirestore.QuerySnapshot = await cardsRef.get();
    const cards: CreditCard[] = [];
    for (const cardDoc of cardSnap.docs) {
      const card: CreditCard = CreditCard.fromObject(cardDoc.data());
      cards.push(card);
    }
    return cards;
  }
  addPromotion(req: PromotionAdditionRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  removePromition(req: PromotionRemovalRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  updatePromotion(req: PromotionUpdateRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  removeUser(req: UserRemovalRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
}
