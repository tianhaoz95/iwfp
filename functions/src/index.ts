import * as functions from "firebase-functions";
import addCreditCardHandler from "./handler/add_credit_card";
import removeCreditCardHandler from "./handler/remove_credit_card";
import editCreditCardHandler from "./handler/edit_credit_card";
import addPromoHandler from "./handler/add_promo";
import removePromoHandler from "./handler/remove_promo";
import getCreditCardHandler from "./handler/get_credit_cards";
import removeUserHandler from "./handler/remove_user";
import Provider from "./provider";
import { FunctionContext } from "./config/typedefs";
import {
  parseCardCreationRequest,
  parseCardRemovalRequest,
  parseCardEditRequest,
  parseCardCreationWithTemplateRequest,
} from "./util/parsers/card";
import {
  parseAddPromoRequest,
  parseRemovePromoRequest,
} from "./util/parsers/promo";
import addCreditCardWithTemplateHandler from "./handler/add_credit_card_with_template";
import {
  PromotionRemovalRequest,
  CreditCardRemovalRequest,
  CreditCardCreationRequest,
  PromotionAdditionRequest,
  CreditCardUpdateRequest,
} from "./interfaces/interfaces";

const provider = new Provider();

export const addCreditCardWithTemplate = functions.https.onCall(
  async (data, fbContext) => {
    const context: FunctionContext = provider.fbContext2context(fbContext);
    const cardCreationWithTemplateRequest: CreditCardCreationRequest = parseCardCreationWithTemplateRequest(
      data
    );
    await addCreditCardWithTemplateHandler(
      cardCreationWithTemplateRequest,
      context,
      provider
    );
  }
);

export const addCreditCard = functions.https.onCall(async (data, fbContext) => {
  const context: FunctionContext = provider.fbContext2context(fbContext);
  const cardCreationRequest: CreditCardCreationRequest = parseCardCreationRequest(
    data
  );
  await addCreditCardHandler(cardCreationRequest, context, provider);
});

export const removeCreditCard = functions.https.onCall(
  async (data, fbContext) => {
    const context: FunctionContext = provider.fbContext2context(fbContext);
    const cardRemovalRequest: CreditCardRemovalRequest = parseCardRemovalRequest(
      data
    );
    await removeCreditCardHandler(cardRemovalRequest, context, provider);
  }
);

export const editCreditCard = functions.https.onCall(
  async (data, fbContext) => {
    const context: FunctionContext = provider.fbContext2context(fbContext);
    const creditCardUpdateRequest: CreditCardUpdateRequest = parseCardEditRequest(
      data
    );
    await editCreditCardHandler(creditCardUpdateRequest, context, provider);
  }
);

export const addPromo = functions.https.onCall(async (data, fbContext) => {
  const context: FunctionContext = provider.fbContext2context(fbContext);
  const addPromoRequest: PromotionAdditionRequest = parseAddPromoRequest(data);
  await addPromoHandler(addPromoRequest, context, provider);
});

export const removePromo = functions.https.onCall(async (data, fbContext) => {
  const context: FunctionContext = provider.fbContext2context(fbContext);
  const removePromoRequest: PromotionRemovalRequest = parseRemovePromoRequest(
    data
  );
  await removePromoHandler(removePromoRequest, context, provider);
});

export const getCreditCards = functions.https.onCall(
  async (data, fbContext) => {
    const context: FunctionContext = provider.fbContext2context(fbContext);
    const response = await getCreditCardHandler(data, context, provider);
    return response;
  }
);

export const removeUser = functions.https.onCall(async (data, fbContext) => {
  const context: FunctionContext = provider.fbContext2context(fbContext);
  await removeUserHandler(data, context, provider);
});
