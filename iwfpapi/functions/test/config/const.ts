export const DatabaseEmulatorAddress: string = "localhost:8080";
export const CloudFunctionEmulatorAddress: string = "http://localhost:5001";

export const EmulatedAppConfig = {
  projectId: "iwfpapp"
};

export const DatabaseSettings = {
  host: DatabaseEmulatorAddress,
  ssl: false
};

export const CloudFunctionScope: string = "/iwfpapp/us-central1";
export const EmulatorHttpFunctionsEndpoint: string =
  "http://localhost:5001" + CloudFunctionScope;
export const HttpAddCreditCardScope: string = "/httpAddCreditCard";
export const HttpAddCreditCardEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpAddCreditCardScope;
