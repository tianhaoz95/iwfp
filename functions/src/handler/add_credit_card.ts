import { noAuthMsg } from "../config/consts";
import { CreditCardIdConflictError } from "../config/errors";
import { FunctionContext } from "../config/typedefs";
import { CreditCardCreationRequest } from "../interfaces/interfaces";

async function addCreditCardHandler(
  data: CreditCardCreationRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardData?.id);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      throw CreditCardIdConflictError;
    } else {
      const cardName: string =
        data.cardData && data.cardData.displayName
          ? data.cardData.displayName
          : "na";
      const status = await cardRef.set({
        card_name: cardName,
      });
      return status;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addCreditCardHandler;
