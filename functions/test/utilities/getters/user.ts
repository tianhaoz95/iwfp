import * as firebase from "firebase";
import "firebase/functions";

export async function backdoorGetUserSnap(
  db: firebase.firestore.Firestore,
  userId: string
): Promise<
  firebase.firestore.DocumentSnapshot<firebase.firestore.DocumentData>
> {
  const userSnap = await db
    .collection("channel")
    .doc("production-v1")
    .collection("users")
    .doc(userId)
    .get();
  return userSnap;
}
