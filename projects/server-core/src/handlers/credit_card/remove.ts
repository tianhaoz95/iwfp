import { ServiceProvider } from "../../providers";
import { CreditCardRemovalRequest, GenericResponse } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const removeCreditCardRequestHandler = async (
  req: CreditCardRemovalRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GenericResponse> => {
  const res: GenericResponse = GenericResponse.create({});
  await serviceProvider.removeCreditCard(req);
  return res;
};
