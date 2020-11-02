import { ServiceProvider } from "../../providers";
import { GenericResponse, PromotionAdditionRequest, PromotionUpdateRequest } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const updatePromotionRequestHandler = async (
  req: PromotionUpdateRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GenericResponse> => {
  const res: GenericResponse = GenericResponse.create({});
  await serviceProvider.updatePromotion(req);
  return res;
};
