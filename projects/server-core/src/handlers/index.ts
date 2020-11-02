import { ServiceProvider } from "../providers";
import { CreditCardCreationRequest, CreditCardFetchRequest, CreditCardRemovalRequest, CreditCardUpdateRequest, GetCreditCardResponse, HttpBasedRequest, HttpBasedResponse, PromotionAdditionRequest, PromotionRemovalRequest, PromotionUpdateRequest } from "../interfaces";
import { LoggingCallback } from "../types";
import { addCreditCardRequestHandler } from "./credit_card/add";
import { fetchCreditCardRequestHandler } from "./credit_card/fetch";
import { addPromotionRequestHandler } from "./promotion/add";
import { removePromotionRequestHandler } from "./promotion/remove";
import { updatePromotionRequestHandler } from "./promotion/update";
import { updateCreditCardRequestHandler } from "./credit_card/update";
import { removeCreditCardRequestHandler } from "./credit_card/remove";

export const handlerRequest = async (
  req: HttpBasedRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<HttpBasedResponse> => {
  if (req.creditCardCreationRequest) {
    logger("Credit card creation request found.", "info");
    const creditCardCreationRequest: CreditCardCreationRequest = CreditCardCreationRequest.create(
      req.creditCardCreationRequest
    );
    const res = await addCreditCardRequestHandler(
      creditCardCreationRequest,
      serviceProvider,
      logger
    );
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      genericResponse: res
    })
    return response;
  } else if (req.creditCardUpdateRequest) {
    logger("Credit card update request found.", "info");
    const creditCardUpdateRequest: CreditCardUpdateRequest = CreditCardUpdateRequest.create(
      req.creditCardUpdateRequest
    );
    const res = await updateCreditCardRequestHandler(
      creditCardUpdateRequest,
      serviceProvider,
      logger
    );
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      genericResponse: res
    })
    return response;
  } else if (req.creditCardRemovalRequest) {
    logger("Credit card removal request found.", "info");
    const creditCardRemovalRequest: CreditCardRemovalRequest = CreditCardRemovalRequest.create(
      req.creditCardRemovalRequest
    );
    const res = await removeCreditCardRequestHandler(
      creditCardRemovalRequest,
      serviceProvider,
      logger
    );
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      genericResponse: res
    })
    return response;
  } else if (req.creditCardFetchRequest) {
    logger("Credit card fetch request found.", "info");
    const creditCardFetchRequest: CreditCardFetchRequest = CreditCardFetchRequest.create(
      req.creditCardFetchRequest
    );
    const res = await fetchCreditCardRequestHandler(
      creditCardFetchRequest,
      serviceProvider,
      logger
    );
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      getCreditCardResponse: res
    });
    return response;
  } else if (req.promotionAdditionRequest) {
    logger("Promotion addition request found.", "info");
    const promotionAdditionRequest: PromotionAdditionRequest = PromotionAdditionRequest.create(
      req.promotionAdditionRequest
    );
    const res = await addPromotionRequestHandler(
      promotionAdditionRequest,
      serviceProvider,
      logger
    );
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      genericResponse: res
    });
    return response;
  } else if (req.promotionRemovalRequest) {
    logger("Promotion removal request found.", "info");
    const promotionRemovalRequest: PromotionRemovalRequest = PromotionRemovalRequest.create(
      req.promotionRemovalRequest
    );
    const res = await removePromotionRequestHandler(
      promotionRemovalRequest,
      serviceProvider,
      logger
    );
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      genericResponse: res
    });
    return response;
  } else if (req.promotionUpdateRequest) {
    logger("Promotion update request found.", "info");
    const promotionUpdateRequest: PromotionUpdateRequest = PromotionUpdateRequest.create(
      req.promotionUpdateRequest
    );
    const res = await updatePromotionRequestHandler(
      promotionUpdateRequest,
      serviceProvider,
      logger
    );
    const response: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.SUCCESS,
      statusCode: 200,
      genericResponse: res
    });
    return response;
  } else {
    throw Error("No known request type found. Abort.");
  }
};
