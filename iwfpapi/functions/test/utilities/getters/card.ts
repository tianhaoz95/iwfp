import * as firebase from "firebase";
import "firebase/functions";

export async function backdoorGetCardSnap(
  db: firebase.firestore.Firestore,
  userId: string,
  cardId: string,
): Promise<firebase.firestore.DocumentSnapshot<firebase.firestore.DocumentData>> {
  const cardSnap = await db
    .collection("channel")
    .doc("production-v1")
    .collection("users")
    .doc(userId)
    .collection("cards")
    .doc(cardId)
    .get();
  return cardSnap;
}

export async function backdoorGetCardData(
  db: firebase.firestore.Firestore,
  userId: string,
  cardId: string,
): Promise<Object|undefined> {
  const cardSnap = await backdoorGetCardSnap(db, userId, cardId);
  return cardSnap.data();
}