import { noAuthMsg, creditCardNotExistError } from "../config/consts";
import { CardEditRequest, FunctionContext } from "../config/typedefs";

async function editCreditCardHandler(
  data: CardEditRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.id);
    const cardSnap = await cardRef.get();
    if (!cardSnap.exists) {
      throw creditCardNotExistError;
    } else {
      const creditCardName: string = data.name;
      await cardRef.set({
        card_name: creditCardName
      });
    }
  } else {
    throw noAuthMsg;
  }
}

export default editCreditCardHandler;
