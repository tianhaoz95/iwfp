import * as functions from "firebase-functions";

import addCreditCardHandler from "./handler/add_credit_card";

export const addCreditCard = functions.https.onCall(addCreditCardHandler);
