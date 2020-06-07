import { noAuthMsg, creditCardNotExistError } from "../config/consts";
import { FunctionContext } from "../config/typedefs";
import { CreditCardUpdateRequest } from "../interfaces/interfaces";

async function editCreditCardHandler(
  data: CreditCardUpdateRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.updatedCardData?.id);
    const cardSnap = await cardRef.get();
    if (!cardSnap.exists) {
      throw creditCardNotExistError;
    } else {
      const creditCardName: string =
        data.updatedCardData && data.updatedCardData.displayName
          ? data.updatedCardData.displayName
          : "na";
      await cardRef.set({
        card_name: creditCardName,
      });
    }
  } else {
    throw noAuthMsg;
  }
}

export default editCreditCardHandler;
