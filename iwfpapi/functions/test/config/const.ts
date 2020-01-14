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

/**
 * Firebase Emulator Suite http API scope definitions
 */
export const HttpAddCreditCardScope: string = "/httpAddCreditCard";
export const HttpRemoveCreditCardScope = "/httpRemoveCreditCard";
export const HttpEditCreditCardScope = "/httpEditCreditCard";
export const HttpAddPromoScope = "/httpAddPromo";

/**
 * Firebase Emulator Suite http AIP endpint definitions
 */
export const HttpAddCreditCardEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpAddCreditCardScope;
export const HttpRemoveCreditCardEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpRemoveCreditCardScope;
export const HttpEditCreditCardEndpoint = EmulatorHttpFunctionsEndpoint + HttpEditCreditCardScope;
export const HttpAddPromoEndpoint = EmulatorHttpFunctionsEndpoint + HttpAddPromoScope;
