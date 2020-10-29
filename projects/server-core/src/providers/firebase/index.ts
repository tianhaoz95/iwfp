import * as admin from "firebase-admin";
import { ServerCore } from "../../core";
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
} from "../../interfaces";

class FirebaseServerCore extends ServerCore {
  initialize(): Promise<void> {
    throw new Error("Method not implemented.");
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
