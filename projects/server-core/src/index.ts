import {
  HttpBasedCredential,
  HttpBasedRequest,
  HttpBasedResponse,
  HttpBasedVersionInfo,
} from "./interfaces";
import { getServiceProvider } from "./providers";

export const processRequest = async (req: HttpBasedRequest): Promise<HttpBasedResponse> => {
  if (req.versionInfo) {
    const versionInfo = HttpBasedVersionInfo.fromObject(req.versionInfo);
    const serviceProvider = getServiceProvider(versionInfo);
    if (req.credential) {
      const cred: HttpBasedCredential = HttpBasedCredential.fromObject(req.credential);
      await serviceProvider.initialize(cred);
      const response: HttpBasedResponse = HttpBasedResponse.create({});
      return response;
    } else {
      throw Error("Credential not found");
    }
  } else {
    throw Error("Version info not found.");
  }
};
