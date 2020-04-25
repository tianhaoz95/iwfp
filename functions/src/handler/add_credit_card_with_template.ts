import { noAuthMsg } from "../config/consts";
import { CreditCardIdConflictError } from "../config/errors";
import {
  FunctionContext,
  CardCreationWithTemplateRequest,
} from "../config/typedefs";
import addPromoHandler from "./add_promo";

function delay(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function addCreditCardWithTemplateHandler(
  data: CardCreationWithTemplateRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.id);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      throw CreditCardIdConflictError;
    } else {
      const cardName: string = data.name;
      await cardRef.set({
        card_name: cardName,
      });
      for (const promo of data.promos) {
        await addPromoHandler(promo, context, provider);
      }
      return;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addCreditCardWithTemplateHandler;
