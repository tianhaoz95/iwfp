import {
  CreditCardCreationRequest,
  CreditCardFetchRequest,
  CreditCardRemovalRequest,
  CreditCardUpdateRequest,
  HttpBasedCredential,
  HttpBasedResponse,
  PromotionAdditionRequest,
  PromotionRemovalRequest,
  PromotionUpdateRequest,
  UserRemovalRequest,
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

  abstract async addCreditCard(
    req: CreditCardCreationRequest
  ): Promise<HttpBasedResponse>;

  abstract async removeCreditCard(
    req: CreditCardUpdateRequest
  ): Promise<HttpBasedResponse>;

  abstract async updateCreditCard(
    req: CreditCardRemovalRequest
  ): Promise<HttpBasedResponse>;

  abstract async fetchCreditCards(
    req: CreditCardFetchRequest
  ): Promise<HttpBasedResponse>;

  abstract async addPromotion(
    req: PromotionAdditionRequest
  ): Promise<HttpBasedResponse>;

  abstract async removePromition(
    req: PromotionRemovalRequest
  ): Promise<HttpBasedResponse>;

  abstract async updatePromotion(
    req: PromotionUpdateRequest
  ): Promise<HttpBasedResponse>;

  abstract async removeUser(
    req: UserRemovalRequest
  ): Promise<HttpBasedResponse>;
}
