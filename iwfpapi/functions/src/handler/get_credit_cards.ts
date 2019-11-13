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
          /**
           * TODO(tianhaoz95): Add a type for response, this is 
           * better off strongly typed.
           */
          let response = {};
          snap.forEach(doc => {
            console.log('retrieve: ', doc.id, '=>', doc.data());
            response[doc.id] = doc.data();
          });
          resolve(response);
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
