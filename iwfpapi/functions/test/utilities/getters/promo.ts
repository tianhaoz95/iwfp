import * as firebase from "firebase";
import "firebase/functions";

export async function backdoorGetPromoSnap(
  db: firebase.firestore.Firestore,
  userId: string,
  cardId: string,
  promoId: string,
): Promise<firebase.firestore.DocumentSnapshot<firebase.firestore.DocumentData>> {
  const promoSnap = await db
    .collection("channel")
    .doc("production-v1")
    .collection("users")
    .doc(userId)
    .collection("cards")
    .doc(cardId)
    .collection("promos")
    .doc(promoId)
    .get();
  return promoSnap;
}

export async function backdoorGetPromo(
  db: firebase.firestore.Firestore,
  userId: string,
  cardId: string,
  promoId: string,
): Promise<Object|undefined> {
  const promoSnap = await backdoorGetPromoSnap(db, userId, cardId, promoId);
  return promoSnap.data();
}