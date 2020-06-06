import * as firebase from "firebase";
import "firebase/functions";
import { backdoorGetUserSnap } from "../getters/user";

export async function backdoorUserExist(
  db: firebase.firestore.Firestore,
  userId: string
): Promise<boolean> {
  const promoSnap = await backdoorGetUserSnap(db, userId);
  return promoSnap.exists;
}
