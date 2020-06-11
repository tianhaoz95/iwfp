import { CreditCard } from "../../interfaces/interfaces";
import Provider from "../../provider";

export async function setCreditCard(
  userId: string,
  card: CreditCard,
  provider: Provider
) {
  const userRef = provider.getUserRef(userId);
  const cardRef = userRef.collection("cards").doc(card.id);
  card.promotions = [];
  await cardRef.set(card.toJSON());
}
