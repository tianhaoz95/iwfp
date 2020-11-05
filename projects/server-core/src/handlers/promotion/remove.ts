import { ServiceProvider } from "../../providers";
import { GenericResponse, PromotionRemovalRequest } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const removePromotionRequestHandler = async (
  req: PromotionRemovalRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GenericResponse> => {
  const res: GenericResponse = GenericResponse.create({});
  await serviceProvider.removePromition(req);
  return res;
};
