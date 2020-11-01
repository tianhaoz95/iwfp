import { ServiceProvider } from "./providers";
import { handlerRequest } from "./handlers";
import {
  HttpBasedCredential,
  HttpBasedRequest,
  HttpBasedResponse,
  HttpBasedVersionInfo,
} from "./interfaces";
import { getServiceProvider } from "./providers";
import { LoggingCallback } from "./types";

export class RequestProcessor {
  initialized: boolean;
  logger: LoggingCallback;
  serviceProvider: ServiceProvider | undefined;

  constructor(logger: LoggingCallback, versionInfo: HttpBasedVersionInfo) {
    this.initialized = false;
    this.logger = logger;
    this.serviceProvider = getServiceProvider(versionInfo, this.logger);
  }

  async process(req: HttpBasedRequest): Promise<HttpBasedResponse> {
    this.logger(
      `Process request in Server Core. Request: ${JSON.stringify(req)}`,
      "info"
    );
    if (req.versionInfo && this.serviceProvider) {
      this.logger("Version info found in the request.", "info");
      const versionInfo = HttpBasedVersionInfo.fromObject(req.versionInfo);
      this.logger(
        `Parsed version info: ${JSON.stringify(versionInfo)}`,
        "info"
      );
      const serviceProvider = getServiceProvider(versionInfo, this.logger);
      if (req.credential) {
        this.logger("Credential info found in the request.", "info");
        const cred: HttpBasedCredential = HttpBasedCredential.fromObject(
          req.credential
        );
        this.logger("Credential info parsed from the request.", "info");
        await serviceProvider.initialize(cred);
        await handlerRequest(req, this.serviceProvider, this.logger);
        const response: HttpBasedResponse = HttpBasedResponse.create({});
        return response;
      } else {
        this.logger("Credential not found", "error");
        throw Error("Credential not found");
      }
    } else {
      this.logger("Version info not found", "error");
      throw Error("Version info not found.");
    }
  }
}
