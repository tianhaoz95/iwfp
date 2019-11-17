import provider from "../provider";
import {
  noAuthMsg,
  creditCardNotExistError,
  promoAlreadyExistError
} from "../config/consts";

function AddPromoHandler(data, context) {
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
                  reject(promoAlreadyExistError);
                } else {
                  const promoName: string = data.promoName;
                  const promoType: string = data.promoType;
                  const promoStart: string = data.promoStart;
                  const promoEnd: string = data.promoEnd;
                  const promoRepeat: string = data.promoRepeat;
                  const promoRate: string = data.promoRate;
                  const promoCategoryId: string = data.promoCategoryId;
                  const promoCategoryName: string = data.promoCategoryName;
                  promoRef
                    .set({
                      promo_name: promoName,
                      promo_id: promoId,
                      promo_type: promoType,
                      promo_start: promoStart,
                      promo_end: promoEnd,
                      promo_repeat_pattern: promoRepeat,
                      promo_rate: promoRate,
                      promo_category_id: promoCategoryId,
                      promo_category_name: promoCategoryName
                    })
                    .then(() => {
                      resolve();
                    })
                    .catch(err => {
                      reject(err);
                    });
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

export default AddPromoHandler;
