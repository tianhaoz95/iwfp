import * as firebase from "firebase";
import "firebase/functions";

export async function backdoorCardExist(
  db: firebase.firestore.Firestore,
  userId: string,
  cardId: string,
): Promise<boolean> {
  const cardSnap = await db
    .collection("channel")
    .doc("production-v1")
    .collection("users")
    .doc(userId)
    .collection("cards")
    .doc(cardId)
    .get();
  return cardSnap.exists;
}