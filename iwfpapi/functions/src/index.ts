import * as functions from "firebase-functions";
import addCreditCardHandler from "./handler/add_credit_card";
import removeCreditCardHandler from "./handler/remove_credit_card";
import editCreditCardHandler from "./handler/edit_credit_card";
import addPromoHandler from "./handler/add_promo";
import removePromoHandler from "./handler/remove_promo";
import getCreditCardHandler from "./handler/get_credit_cards";
import removeUserHandler from "./handler/remove_user";
import Provider from "./provider";
import { FunctionContext, CardData } from "./config/typedefs";
import { parseCardDataFromRequest } from "./util/parsers/card_data_parser";

const provider = new Provider();

export const addCreditCard = functions.https.onCall(async (data, fbContext) => {
  const context: FunctionContext = provider.fbContext2context(fbContext);
  const cardData: CardData = parseCardDataFromRequest(data);
  await addCreditCardHandler(cardData, context, provider);
});

export const httpAddCreditCard = functions.https.onRequest(async (req, res) => {
  const context: FunctionContext = await provider.token2context(req.body.token);
  const cardData: CardData = parseCardDataFromRequest(req.body);
  try {
    await addCreditCardHandler(cardData, context, provider);
  } catch (err) {
    console.log(JSON.stringify(err));
    res.sendStatus(500);
  }
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

export const removeUser = functions.https.onCall(async (data, context) => {
  await removeUserHandler(data, context, provider);
});
