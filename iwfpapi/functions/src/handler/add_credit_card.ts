import provider from '../provider';

function AddCreditCardHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      const userUid = context.auth.uid;
      const userRef = provider.getUserRef(userUid);
      const cardRef = userRef.collection("cards").doc(data.cardUid);
      cardRef
        .get()
        .then(snap => {
          if (snap.exists) {
            reject("Card exist");
          } else {
            let cardName: string = data.cardData;
            cardRef
              .set({
                'card_name': cardName
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
      reject("User not signed in");
    }
  });
}

export default AddCreditCardHandler;