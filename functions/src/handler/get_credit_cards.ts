import { FunctionContext } from "../config/typedefs";
import {
  GetCreditCardResponse,
  CreditCard,
  Promotion,
} from "../interfaces/interfaces";
import { UnauthenticatedUserError } from "../config/errors";

async function getCreditCardsHandler(data, context: FunctionContext, provider) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards");
    const cardSnap: FirebaseFirestore.QuerySnapshot = await cardRef.get();
    console.log(
      "cards under the user " +
        userUid +
        " with size " +
        cardSnap.size +
        " are: " +
        cardSnap.docs
    );
    const response: GetCreditCardResponse = GetCreditCardResponse.create();
    for (const cardDoc of cardSnap.docs) {
      const card: CreditCard = CreditCard.fromObject(cardDoc.data());
      const promoRef = cardRef.doc(card.id).collection("promos");
      const promoSnap: FirebaseFirestore.QuerySnapshot = await promoRef.get();
      if (promoSnap.empty) {
        console.log("no promo found");
      } else {
        console.log("promos found, retrieve promos");
        for (const promoDoc of promoSnap.docs) {
          const promo: Promotion = Promotion.fromObject(promoDoc.data());
          card.promotions.push(promo);
        }
      }
      response.cards.push(card);
    }
    const serializedBytes: Uint8Array = GetCreditCardResponse.encode(
      response
    ).finish();
    return {
      serialized: Array.from(serializedBytes),
    };
  } else {
    throw UnauthenticatedUserError;
  }
}

export default getCreditCardsHandler;
