import {
  CreditCardCreationRequest,
  CreditCardFetchRequest,
  CreditCardRemovalRequest,
  CreditCardUpdateRequest,
  HttpBasedCredential,
  PromotionAdditionRequest,
  PromotionRemovalRequest,
  PromotionUpdateRequest,
  UserRemovalRequest,
  CreditCard,
} from "../interfaces";

/**
 * Server Core Interface
 *
 * The interface for the service supplied to the
 * server core to fulfill the APIs.
 */
export abstract class ServiceProvider {
  abstract requiresAsyncInitialization(): boolean;

  abstract async initialize(credential: HttpBasedCredential): Promise<void>;

  abstract async sanityCheck(): Promise<void>;

  abstract async addCreditCard(req: CreditCardCreationRequest): Promise<void>;

  abstract async removeCreditCard(req: CreditCardUpdateRequest): Promise<void>;

  abstract async updateCreditCard(req: CreditCardRemovalRequest): Promise<void>;

  abstract async fetchCreditCards(
    req: CreditCardFetchRequest
  ): Promise<CreditCard[]>;

  abstract async addPromotion(req: PromotionAdditionRequest): Promise<void>;

  abstract async removePromition(req: PromotionRemovalRequest): Promise<void>;

  abstract async updatePromotion(req: PromotionUpdateRequest): Promise<void>;

  abstract async removeUser(req: UserRemovalRequest): Promise<void>;
}
