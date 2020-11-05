import { ServiceProvider } from "../../providers";
import { GenericResponse, UserRemovalRequest } from "../../interfaces";
import { LoggingCallback } from "../../types";

export const removeUserRequestHandler = async (
  req: UserRemovalRequest,
  serviceProvider: ServiceProvider,
  logger: LoggingCallback
): Promise<GenericResponse> => {
  const res: GenericResponse = GenericResponse.create({});
  await serviceProvider.removeUser(req);
  return res;
};
