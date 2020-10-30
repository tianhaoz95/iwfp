import { ServiceProvider } from "../core";
import { HttpBasedVersionInfo } from "../interfaces";
import { FirebaseServiceProvider } from "./firebase";
import { MockServiceProvider } from "./mock";

export const getServiceProvider = (
  versionInfo: HttpBasedVersionInfo
): ServiceProvider => {
  if (versionInfo.serviceType === HttpBasedVersionInfo.ServiceType.FIREBASE) {
    return new FirebaseServiceProvider();
  } else if (
    versionInfo.serviceType === HttpBasedVersionInfo.ServiceType.MOCK
  ) {
    return new MockServiceProvider();
  } else {
    throw Error("Unknown");
  }
};
