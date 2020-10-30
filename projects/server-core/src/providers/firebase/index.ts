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
  }

  requiresAsyncInitialization(): boolean {
    return false;
  }

  async initialize(credential: HttpBasedCredential): Promise<void> {
    await this.authenticate(credential);
  }

  async authenticate(credential: HttpBasedCredential): Promise<void> {
    const verifyResult = await this.app.auth().verifyIdToken(credential.token);
    this.authUid = verifyResult.uid;
  }

  addCreditCard(req: CreditCardCreationRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  removeCreditCard(req: CreditCardUpdateRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  updateCreditCard(req: CreditCardRemovalRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
  }
  fetchCreditCards(req: CreditCardFetchRequest): Promise<HttpBasedResponse> {
    throw new Error("Method not implemented.");
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
