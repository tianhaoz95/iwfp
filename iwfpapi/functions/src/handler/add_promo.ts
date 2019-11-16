import provider from "../provider";
import { noAuthMsg, creditCardNotExistError } from "../config/consts";

function AddPromoHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      const userUid = context.auth.uid;
      const userRef = provider.getUserRef(userUid);
      const cardRef = userRef.collection("cards").doc(data.cardUid);
      cardRef.get().then((snap) => {
        if (snap.exists) {
          const promoUid = data.promoUid;
          const promoRef = cardRef.collection("promos").doc(promoUid);
        } else {
          reject(creditCardNotExistError);
        }
      }).catch((err) => {
        reject(err);
      });
    } else {
      reject(noAuthMsg);
    }
  });
}

export default AddPromoHandler;
