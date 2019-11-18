import provider from "../provider";
import { noAuthMsg, creditCardNotExistError } from "../config/consts";

function RemovePromoHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      const userUid = context.auth.uid;
      const userRef = provider.getUserRef(userUid);
      const cardRef = userRef.collection("cards").doc(data.cardUid);
      cardRef
        .get()
        .then(cardSnap => {
          if (cardSnap.exists) {
            const promoId: string = data.promoId;
            const promoRef = cardRef.collection("promos").doc(promoId);
            promoRef
              .get()
              .then(promoSnap => {
                if (promoSnap.exists) {
                  promoRef
                    .delete()
                    .then(() => {
                      resolve();
                    })
                    .catch(err => {
                      reject(err);
                    });
                } else {
                  reject();
                }
              })
              .catch(err => {
                reject(err);
              });
          } else {
            reject(creditCardNotExistError);
          }
        })
        .catch(err => {
          reject(err);
        });
    } else {
      reject(noAuthMsg);
    }
  });
}

export default RemovePromoHandler;
