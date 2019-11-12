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
        .then(snap => {
          resolve(snap);
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
