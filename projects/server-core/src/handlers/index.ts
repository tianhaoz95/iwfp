import { ServiceProvider } from "../providers";
import { CreditCardCreationRequest, HttpBasedRequest } from "../interfaces";
import { LoggingCallback } from "../types";
import { addCreditCardRequestHandler } from "./credit_card/add";

export const handlerRequest = async (
  req: HttpBasedRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<void> => {
  if (req.creditCardCreationRequest) {
    logger("Credit card creation request found.", "info");
    const creditCardCreationRequest: CreditCardCreationRequest = CreditCardCreationRequest.create(
      req.creditCardCreationRequest
    );
    await addCreditCardRequestHandler(
      creditCardCreationRequest,
      serviceProvider,
      logger
    );
  } else if (req.creditCardUpdateRequest) {
    logger("Credit card update request found.", "info");
  } else if (req.creditCardRemovalRequest) {
    logger("Credit card removal request found.", "info");
  } else if (req.creditCardFetchRequest) {
    logger("Credit card fetch request found.", "info");
  } else if (req.promotionAdditionRequest) {
    logger("Promotion addition request found.", "info");
  } else if (req.promotionRemovalRequest) {
    logger("Promotion removal request found.", "info");
  } else if (req.promotionUpdateRequest) {
    logger("Promotion update request found.", "info");
  } else {
    throw Error("No known request type found. Abort.");
  }
};
