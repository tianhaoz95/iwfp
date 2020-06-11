import * as functions from "firebase-functions";

// User related errors

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

// Credit card related errors

export const EmptyWalletError = new functions.https.HttpsError(
  "not-found",
  "No card found, wallet is empty"
);

export const CreditCardIdConflictError = new functions.https.HttpsError(
  "already-exists",
  "The credit card ID has already existed"
);

export const CardForDeletionNotExist = new functions.https.HttpsError(
  "not-found",
  "The credit card to be deleted does not exist"
);

// Promotion related errors

export const PromoNotExistError = new functions.https.HttpsError(
  "not-found",
  "The promotion ID does not exist"
);

export const PromotionIdMissingError = new functions.https.HttpsError(
  "not-found",
  "The ID of the promotion is missing"
);
