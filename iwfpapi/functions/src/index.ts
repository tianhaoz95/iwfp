import * as functions from "firebase-functions";
import addCreditCardHandler from "./handler/add_credit_card";
import removeCreditCardHandler from "./handler/remove_credit_card";
import editCreditCardHandler from "./handler/edit_credit_card";
import addPromoHandler from "./handler/add_promo";
import removePromoHandler from "./handler/remove_promo";

export const addCreditCard = functions.https.onCall(addCreditCardHandler);
export const removeCreditCard = functions.https.onCall(removeCreditCardHandler);
export const editCreditCard = functions.https.onCall(editCreditCardHandler);
export const addPromo = functions.https.onCall(addPromoHandler);
export const removePromo = functions.https.onCall(removePromoHandler);
