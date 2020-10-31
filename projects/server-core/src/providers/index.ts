import { ServiceProvider } from "../core";
import { HttpBasedVersionInfo } from "../interfaces";
import { FirebaseServiceProvider } from "./firebase";
import { MockServiceProvider } from "./mock";

export const getServiceProvider = (
  versionInfo: HttpBasedVersionInfo,
  logger: (msg: string, type: "info" | "error") => void
): ServiceProvider => {
  if (versionInfo.serviceType === HttpBasedVersionInfo.ServiceType.FIREBASE) {
    logger("Initialize Firebase service provider", "info");
    return new FirebaseServiceProvider();
  } else if (
    versionInfo.serviceType === HttpBasedVersionInfo.ServiceType.MOCK
  ) {
    logger("Initialize Mock service provider", "info");
    return new MockServiceProvider();
  } else {
    throw Error("Unknown");
  }
};
