import provider from "../provider";
import { noAuthMsg, creditCardNotExistError } from "../config/consts";

function EditCreditCardHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      const userUid = context.auth.uid;
      const userRef = provider.getUserRef(userUid);
      const cardRef = userRef.collection("cards").doc(data.cardUid);
      cardRef
        .get()
        .then(snap => {
          if (!snap.exists) {
            reject(creditCardNotExistError);
          } else {
            const creditCardName: string = data.cardData;
            cardRef
              .set({
                card_name: creditCardName
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
      reject(noAuthMsg);
    }
  });
}

export default EditCreditCardHandler;
