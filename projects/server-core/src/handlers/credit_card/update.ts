import { ServiceProvider } from "../../providers";
import { CreditCardUpdateRequest, GenericResponse } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const updateCreditCardRequestHandler = async (
  req: CreditCardUpdateRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GenericResponse> => {
  const res: GenericResponse = GenericResponse.create({});
  await serviceProvider.updateCreditCard(req);
  return res;
};
