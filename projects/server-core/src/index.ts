import {
  HttpBasedCredential,
  HttpBasedRequest,
  HttpBasedResponse,
  HttpBasedVersionInfo,
} from "./interfaces";
import { getServiceProvider } from "./providers";

export const processRequest = async (
  req: HttpBasedRequest,
  logger: (msg: string, type: "info" | "error") => void,
): Promise<HttpBasedResponse> => {
  logger(`Process request in Server Core. Request: ${JSON.stringify(req)}`, "info");
  if (req.versionInfo) {
    logger("Version info found in the request.", "info");
    const versionInfo = HttpBasedVersionInfo.fromObject(req.versionInfo);
    logger(`Parsed version info: ${JSON.stringify(versionInfo)}`, "info");
    const serviceProvider = getServiceProvider(versionInfo, logger);
    if (req.credential) {
      logger("Credential info found in the request.", "info");
      const cred: HttpBasedCredential = HttpBasedCredential.fromObject(
        req.credential
      );
      logger("Credential info parsed from the request.", "info");
      await serviceProvider.initialize(cred);
      const response: HttpBasedResponse = HttpBasedResponse.create({});
      return response;
    } else {
      logger("Credential not found", "error");
      throw Error("Credential not found");
    }
  } else {
    logger("Version info not found", "error");
    throw Error("Version info not found.");
  }
};
