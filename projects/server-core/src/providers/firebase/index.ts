import * as admin from "firebase-admin";
import { ServiceProvider } from "../../core";
import {
  CreditCardCreationRequest,
  HttpBasedResponse,
  CreditCardUpdateRequest,
  CreditCardRemovalRequest,
  CreditCardFetchRequest,
  PromotionAdditionRequest,
  PromotionRemovalRequest,
  PromotionUpdateRequest,
  UserRemovalRequest,
  HttpBasedCredential,
  CreditCard,
  GetCreditCardResponse,
} from "../../interfaces";
import fs from "fs";

export class FirebaseServiceProvider extends ServiceProvider {
  app: admin.app.App;
  authenticated: boolean;
  authUid: string;

  constructor() {
    super();
    this.authenticated = false;
    this.authUid = "unknown";
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
    const cred: admin.credential.Credential = admin.credential.cert({
      projectId,
      clientEmail,
      privateKey,
    });
    this.app = admin.initializeApp({
      credential: cred,
      databaseURL: "https://iwfpapp.firebaseio.com",
    });
    if (process.env["USE_FIREBASE_EMULATOR"] === "true") {
      this.app.firestore().settings({
        ssl: false,
        host: "localhost:8080",
        servicePath: undefined,
      });
      this.app.firestore().settings({
        ssl: false,
        host: "localhost:9099",
        servicePath: undefined,
      });
    }
  }

  getUserRef(
    userId: string
  ): FirebaseFirestore.DocumentReference<FirebaseFirestore.DocumentData> {
    return this.app
      .firestore()
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc(userId);
  }

  requiresAsyncInitialization(): boolean {
    return false;
  }

  async initialize(credential: HttpBasedCredential): Promise<void> {
    await this.authenticate(credential);
  }

  sanityCheck(): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }

  async authenticate(credential: HttpBasedCredential): Promise<void> {
    if (process.env["FIREBASE_AUTH_UID_OVERRIDE"]) {
      this.authUid = process.env["FIREBASE_AUTH_UID_OVERRIDE"];
    } else {
      const verifyResult = await this.app.auth().verifyIdToken(credential.token);
      this.authUid = verifyResult.uid;
    }
  }

  async addCreditCard(
    req: CreditCardCreationRequest
  ): Promise<HttpBasedResponse> {
    if (req.cardData && req.cardData.id) {
      const userId: string = this.authUid;
      const userRef = this.getUserRef(userId);
      const cardRef = userRef.collection("cards").doc(req.cardData.id);
      const cardSnap = await cardRef.get();
      if (cardSnap.exists) {
        throw Error("Card already exist.");
      } else {
        const cardData: CreditCard = CreditCard.fromObject(req.cardData);
        await cardRef.set(cardData.toJSON());
        const response: HttpBasedResponse = HttpBasedResponse.create({
          status: HttpBasedResponse.Status.SUCCESS,
          statusCode: 200,
          genericResponse: {
            msg: "Add credit card success.",
          },
        });
        return response;
      }
    } else {
      throw Error("Card data missing or incomplete.");
    }
  }
  removeCreditCard(req: CreditCardUpdateRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  updateCreditCard(req: CreditCardRemovalRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  async fetchCreditCards(req: CreditCardFetchRequest): Promise<HttpBasedResponse> {
    const userRef = this.getUserRef(this.authUid);
    const cardsRef = userRef.collection("cards");
    const cardSnap: FirebaseFirestore.QuerySnapshot = await cardsRef.get();
    const cardsResponse: GetCreditCardResponse = GetCreditCardResponse.create();
    for (const cardDoc of cardSnap.docs) {
      const card: CreditCard = CreditCard.fromObject(cardDoc.data());
      cardsResponse.cards.push(card);
    }
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      getCreditCardResponse: cardsResponse,
    });
    return response;
  }
  addPromotion(req: PromotionAdditionRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  removePromition(req: PromotionRemovalRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  updatePromotion(req: PromotionUpdateRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  removeUser(req: UserRemovalRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
}
