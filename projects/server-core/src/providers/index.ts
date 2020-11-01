import { ServiceProvider } from "./base";
import { HttpBasedVersionInfo } from "../interfaces";
import { FirebaseServiceProvider } from "./firebase";
import { MockServiceProvider } from "./mock";

export const getServiceProvider = (
  versionInfo: HttpBasedVersionInfo,
  logger: (msg: string, type: "info" | "error") => void
): ServiceProvider => {
  if (versionInfo.serviceType === HttpBasedVersionInfo.ServiceType.FIREBASE) {
    logger("Initialize Firebase service provider", "info");
    return new FirebaseServiceProvider(logger);
  } else if (
    versionInfo.serviceType === HttpBasedVersionInfo.ServiceType.MOCK
  ) {
    logger("Initialize Mock service provider", "info");
    return new MockServiceProvider(logger);
  } else {
    throw Error("Unknown");
  }
};

export { ServiceProvider };
