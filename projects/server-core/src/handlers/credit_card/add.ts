import { ServiceProvider } from "../../providers";
import { CreditCardCreationRequest, GenericResponse } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const addCreditCardRequestHandler = async (
  req: CreditCardCreationRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GenericResponse> => {
  const res: GenericResponse = GenericResponse.create({});
  await serviceProvider.addCreditCard(req);
  res.msg = "Credit card added.";
  return res;
};
