import * as firebase from "firebase";
import { backdoorGetPromoSnap } from "../getters/promo";
import "firebase/functions";

export async function backdoorPromoExist(
  db: firebase.firestore.Firestore,
  userId: string,
  cardId: string,
  promoId: string
): Promise<boolean> {
  const promoSnap = await backdoorGetPromoSnap(db, userId, cardId, promoId);
  return promoSnap.exists;
}
