import { noAuthMsg } from "../config/consts";
import { CreditCardIdConflictError } from "../config/errors";
import { CardData, FunctionContext } from "../config/typedefs";

async function addCreditCardHandler(data: CardData, context: FunctionContext, provider) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.id);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      throw CreditCardIdConflictError;
    } else {
      const cardName: string = data.name;
      const status = await cardRef.set({
        card_name: cardName,
        card_id: data.id,
      });
      return status;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addCreditCardHandler;
