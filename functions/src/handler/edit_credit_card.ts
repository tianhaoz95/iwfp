import { noAuthMsg, creditCardNotExistError } from "../config/consts";
import { FunctionContext } from "../config/typedefs";
import { CreditCardUpdateRequest, CreditCard } from "../interfaces/interfaces";
import { setCreditCard } from "./setters/set_credit_card";

async function editCreditCardHandler(
  data: CreditCardUpdateRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userId: string = context.uid;
    const userRef = provider.getUserRef(userId);
    const cardRef = userRef.collection("cards").doc(data.updatedCardData?.id);
    const cardSnap = await cardRef.get();
    if (!cardSnap.exists) {
      throw creditCardNotExistError;
    } else {
      if (data.updatedCardData) {
        await setCreditCard(
          userId,
          CreditCard.create(data.updatedCardData),
          provider
        );
      }
    }
  } else {
    throw noAuthMsg;
  }
}

export default editCreditCardHandler;
