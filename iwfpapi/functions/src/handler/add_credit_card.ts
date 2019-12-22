import { noAuthMsg, creditCardAlreadyExistError } from "../config/consts";

async function addCreditCardHandler(data, context, provider) {
  if (context.auth) {
    const userUid = context.auth.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardUid);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      throw creditCardAlreadyExistError;
    } else {
      const cardName: string = data.cardData;
      await cardRef.set({card_name: cardName});
    }
  } else {
    throw noAuthMsg;
  }
}

export default addCreditCardHandler;
