import { noAuthMsg } from "../config/consts";
import { FunctionContext } from "../config/typedefs";

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
    const response = {};
    for (const card of cardSnap.docs) {
      console.log("retrieve card: ", card.id, "=>", card.data());
      response[card.id] = card.data();
      const promoRef = cardRef.doc(card.id).collection("promos");
      const promoSnap: FirebaseFirestore.QuerySnapshot = await promoRef.get();
      const promos = {};
      if (promoSnap.empty) {
        console.log("no promo found");
      } else {
        console.log("promos found, retrieve promos");
        for (const promo of promoSnap.docs) {
          console.log("retrieved promo: ", promo.id, "=>", promo.data());
          promos[promo.id] = promo.data();
        }
        response[card.id]["promos"] = promos;
        console.log("card data and all promos retrieved");
      }
    }
    console.log("return response: ", response);
    return response;
  } else {
    throw noAuthMsg;
  }
}

export default getCreditCardsHandler;
