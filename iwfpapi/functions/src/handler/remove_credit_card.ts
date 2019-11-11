import provider from "../provider";
import { noAuthMsg } from "../config/consts";

function RemoveCreditCardHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      const userUid = context.auth.uid;
      const userRef = provider.getUserRef(userUid);
      const cardRef = userRef.collection("cards").doc(data.cardUid);
      cardRef
        .delete()
        .then(() => {
          resolve();
        })
        .catch(err => {
          reject(err);
        });
    } else {
      reject(noAuthMsg);
    }
  });
}

export default RemoveCreditCardHandler;
