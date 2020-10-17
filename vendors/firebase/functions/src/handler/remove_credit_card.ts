import { FunctionContext } from "../config/typedefs";
import {
  CardForDeletionNotExist,
  UnauthenticatedUserError,
} from "../config/errors";
import { CreditCardRemovalRequest } from "../interfaces/interfaces";

async function removeCreditCardHandler(
  data: CreditCardRemovalRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardId);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      await cardRef.delete();
    } else {
      throw CardForDeletionNotExist;
    }
  } else {
    throw UnauthenticatedUserError;
  }
}

export default removeCreditCardHandler;
