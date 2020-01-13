import { noAuthMsg } from "../config/consts";
import { CardRemovalRequest, FunctionContext } from "../config/typedefs";
import { CardForDeletionNotExist } from "../config/errors";

async function removeCreditCardHandler(
  data: CardRemovalRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.id);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      await cardRef.delete();
    } else {
      throw CardForDeletionNotExist;
    }
  } else {
    throw noAuthMsg;
  }
}

export default removeCreditCardHandler;
