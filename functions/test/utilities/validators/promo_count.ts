import * as firebase from "firebase";
import "firebase/functions";

export async function backdoorCardPromoCnt(
  db: firebase.firestore.Firestore,
  userId: string,
  cardId: string,
): Promise<number> {
  const promosCollectionSnap = await db
    .collection("channel")
    .doc("production-v1")
    .collection("users")
    .doc(userId)
    .collection("cards")
    .doc(cardId)
    .collection("promos")
    .get();
  return promosCollectionSnap.docs.length;
}