import { ServiceProvider } from "../../providers";
import { CreditCard, CreditCardFetchRequest, GetCreditCardResponse } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const fetchCreditCardRequestHandler = async (
  req: CreditCardFetchRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GetCreditCardResponse> => {
  const res: GetCreditCardResponse = GetCreditCardResponse.create({});
  const cards: CreditCard[] = await serviceProvider.fetchCreditCards(req);
  res.cards = cards;
  return res;
};
