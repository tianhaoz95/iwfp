import { ServiceProvider } from "../../providers";
import { GenericResponse, PromotionAdditionRequest } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const addPromotionRequestHandler = async (
  req: PromotionAdditionRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GenericResponse> => {
  const res: GenericResponse = GenericResponse.create({});
  await serviceProvider.addPromotion(req);
  return res;
};
