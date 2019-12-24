import * as functions from "firebase-functions";
import addCreditCardHandler from "./handler/add_credit_card";
import removeCreditCardHandler from "./handler/remove_credit_card";
import editCreditCardHandler from "./handler/edit_credit_card";
import addPromoHandler from "./handler/add_promo";
import removePromoHandler from "./handler/remove_promo";
import getCreditCardHandler from "./handler/get_credit_cards";
import Provider from "./provider";

const provider = new Provider();

export const addCreditCard = functions.https.onCall(async (data, context) => {
  await addCreditCardHandler(data, context, provider);
});

export const removeCreditCard = functions.https.onCall(
  async (data, context) => {
    await removeCreditCardHandler(data, context, provider);
  }
);

export const editCreditCard = functions.https.onCall(async (data, context) => {
  await editCreditCardHandler(data, context, provider);
});

export const addPromo = functions.https.onCall(async (data, context) => {
  await addPromoHandler(data, context, provider);
});

export const removePromo = functions.https.onCall(async (data, context) => {
  await removePromoHandler(data, context, provider);
});

export const getCreditCards = functions.https.onCall(async (data, context) => {
  const response = await getCreditCardHandler(data, context, provider);
  return response;
});
