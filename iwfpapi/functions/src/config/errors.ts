import * as functions from "firebase-functions";

export const EmptyWalletError = new functions.https.HttpsError(
  "not-found",
  "No card found, wallet is empty"
);

export const CreditCardIdConflictError = new functions.https.HttpsError(
  "already-exists",
  "The credit card ID has already existed"
);

export const PromoNotExistError = new functions.https.HttpsError(
  "not-found",
  "The promotion ID does not exist"
);

export const UnknownUserError = new functions.https.HttpsError(
  "unknown",
  "Unknown user, uid not exist"
);

export const UnauthenticatedUserError = new functions.https.HttpsError(
  "unknown",
  "Unknown user, not authenticated"
);

export const AttemptDeleteNonTestUserError = new functions.https.HttpsError(
  "permission-denied",
  "Deleting normal users in testing mode is not allowed"
);

export const CardForDeletionNotExist = new functions.https.HttpsError(
  "not-found",
  "The credit card to be deleted does not exist"
);
