import * as admin from "firebase-admin";

export const DatabaseEmulatorAddress: string = "localhost:8080";
export const CloudFunctionEmulatorAddress: string = "http://localhost:5001";

export const EmulatedAppConfig = {
  projectId: "iwfpapp",
};

export const EmulatedAdminAppConfig: admin.AppOptions = {
  projectId: "iwfpapp",
  databaseURL: DatabaseEmulatorAddress,
};

export const DatabaseSettings = {
  host: DatabaseEmulatorAddress,
  ssl: false,
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
export const HttpRemoveUserScope = "/httpRemoveUser";
export const HttpRemovePromoScope = "/httpRemovePromo";
export const HttpGetCreditCardsScope = "/httpGetCreditCards";

/**
 * Firebase Emulator Suite http AIP endpint definitions
 */
export const HttpAddCreditCardEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpAddCreditCardScope;
export const HttpRemoveCreditCardEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpRemoveCreditCardScope;
export const HttpEditCreditCardEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpEditCreditCardScope;
export const HttpAddPromoEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpAddPromoScope;
export const HttpRemoveUserEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpRemoveUserScope;
export const HttpRemovePromoEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpRemovePromoScope;
export const HttpGetCreditCardsEndpoint: string =
  EmulatorHttpFunctionsEndpoint + HttpGetCreditCardsScope;
