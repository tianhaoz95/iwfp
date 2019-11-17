import provider from "../provider";
import { noAuthMsg } from "../config/consts";

function getCreditCardsHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      const userUid = context.auth.uid;
      const userRef = provider.getUserRef(userUid);
      const cardRef = userRef.collection("cards");
      cardRef
        .get()
        .then(cardSnap => {
          /**
           * TODO(tianhaoz95): Add a type for response, this is
           * better off strongly typed.
           */
          const response = {};
          cardSnap.forEach(card => {
            console.log("retrieve card: ", card.id, "=>", card.data());
            response[card.id] = card.data();
            const promoRef = cardRef.doc(card.id).collection("promos");
            promoRef.get().then((promoSnap) => {
              let promos = {};
              promoSnap.forEach(promo => {
                console.log("retrieve promo: ", promo.id, "=>", promo.data());
                promos[promo.id] = promo.data();
              });
              response[card.id]["promos"] = promos;
              resolve(response);
            }).catch((err) => {
              reject(err);
            });
          });
        })
        .catch(err => {
          reject(err);
        });
    } else {
      reject(noAuthMsg);
    }
  });
}

export default getCreditCardsHandler;
