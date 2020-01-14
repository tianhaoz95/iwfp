import * as functions from "firebase-functions";
import addCreditCardHandler from "./handler/add_credit_card";
import removeCreditCardHandler from "./handler/remove_credit_card";
import editCreditCardHandler from "./handler/edit_credit_card";
import addPromoHandler from "./handler/add_promo";
import removePromoHandler from "./handler/remove_promo";
import getCreditCardHandler from "./handler/get_credit_cards";
import removeUserHandler from "./handler/remove_user";
import Provider from "./provider";
import {
  FunctionContext,
  CardCreationRequest,
  CardRemovalRequest,
  CardEditRequest,
  AddPromoRequest
} from "./config/typedefs";
import {
  parseCardCreationRequest,
  parseCardRemovalRequest,
  parseCardEditRequest
} from "./util/parsers/card";
import { parseAddPromoRequest } from "./util/parsers/promo";

const provider = new Provider();

export const addCreditCard = functions.https.onCall(async (data, fbContext) => {
  const context: FunctionContext = provider.fbContext2context(fbContext);
  const cardCreationRequest: CardCreationRequest = parseCardCreationRequest(
    data
  );
  await addCreditCardHandler(cardCreationRequest, context, provider);
});

export const httpAddCreditCard = functions.https.onRequest(async (req, res) => {
  if (req.method !== "POST") {
    console.log("Add credit card only accepts POST request");
    res.sendStatus(403);
    return;
  }
  const context: FunctionContext = await provider.token2context(req.body.token);
  const cardCreationRequest: CardCreationRequest = parseCardCreationRequest(
    req.body
  );
  try {
    await addCreditCardHandler(cardCreationRequest, context, provider);
    res.sendStatus(200);
  } catch (err) {
    console.log(JSON.stringify(err));
    res.sendStatus(500);
  }
});

export const removeCreditCard = functions.https.onCall(
  async (data, fbContext) => {
    const context: FunctionContext = provider.fbContext2context(fbContext);
    const cardRemovalRequest: CardRemovalRequest = parseCardRemovalRequest(
      data
    );
    await removeCreditCardHandler(cardRemovalRequest, context, provider);
  }
);

export const httpRemoveCreditCard = functions.https.onRequest(
  async (req, res) => {
    if (req.method !== "POST") {
      console.log("Remove credit card only accepts POST request");
      res.sendStatus(403);
      return;
    }
    const context: FunctionContext = await provider.token2context(
      req.body.token
    );
    const cardRemovalRequest: CardRemovalRequest = parseCardRemovalRequest(
      req.body
    );
    try {
      await removeCreditCardHandler(cardRemovalRequest, context, provider);
      res.sendStatus(200);
    } catch (err) {
      console.log(JSON.stringify(err));
      res.sendStatus(500);
    }
  }
);

export const editCreditCard = functions.https.onCall(
  async (data, fbContext) => {
    const context: FunctionContext = provider.fbContext2context(fbContext);
    const cardEditRequest: CardEditRequest = parseCardEditRequest(data);
    await editCreditCardHandler(cardEditRequest, context, provider);
  }
);

export const httpEditCreditCard = functions.https.onRequest(
  async (req, res) => {
    if (req.method !== "POST") {
      console.log("Edit credit card only accepts POST request");
      res.sendStatus(403);
      return;
    }
    const context: FunctionContext = await provider.token2context(
      req.body.token
    );
    const cardEditRequest: CardEditRequest = parseCardEditRequest(req.body);
    try {
      await editCreditCardHandler(cardEditRequest, context, provider);
      res.sendStatus(200);
    } catch (err) {
      console.log(JSON.stringify(err));
      res.sendStatus(500);
    }
  }
);

export const addPromo = functions.https.onCall(async (data, fbContext) => {
  const context: FunctionContext = provider.fbContext2context(fbContext);
  const addPromoRequest: AddPromoRequest = parseAddPromoRequest(data);
  await addPromoHandler(addPromoRequest, context, provider);
});

export const httpAddPromo = functions.https.onRequest(async (req, res) => {
  if (req.method !== "POST") {
    console.log("Add promotion only accepts POST request");
    res.sendStatus(403);
    return;
  }
  const context: FunctionContext = await provider.token2context(
    req.body.token
  );
  const addPromoRequest: AddPromoRequest = parseAddPromoRequest(req.body);
  try {
    await addPromoHandler(addPromoRequest, context, provider);
    res.sendStatus(200);
  } catch (err) {
    console.log(JSON.stringify(err));
    res.sendStatus(500);
  }
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
