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
import { LoggingCallback } from "../../types";

export class MockServiceProvider extends ServiceProvider {
  constructor(logger: LoggingCallback) {
    super();
  }
  requiresAsyncInitialization(): boolean {
    throw new Error("Method not implemented.");
  }
  initialize(credential: HttpBasedCredential): Promise<void> {
    throw new Error("Method not implemented.");
  }
  sanityCheck(): Promise<void> {
    throw new Error("Method not implemented.");
  }
  addCreditCard(req: CreditCardCreationRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  removeCreditCard(req: CreditCardUpdateRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  updateCreditCard(req: CreditCardRemovalRequest): Promise<void> {
    throw new Error("Method not implemented.");
  }
  fetchCreditCards(req: CreditCardFetchRequest): Promise<CreditCard[]> {
    throw new Error("Method not implemented.");
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
