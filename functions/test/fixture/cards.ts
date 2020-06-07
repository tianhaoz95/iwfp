import { CreditCard } from "../../src/interfaces/interfaces";
import { createBasicPromotion } from "./promos";

export function createTestCreditCard(): CreditCard {
  const card: CreditCard = CreditCard.create({
    id: "test_card_id",
    displayName: "test_card_name",
  });
  return card;
}

export function createTestCreditCardTemplate(): CreditCard {
  const template: CreditCard = CreditCard.create({
    id: "test_card_id",
    displayName: "test_card_name",
    promotions: [
      createBasicPromotion(),
      createBasicPromotion("test_promo_alternative"),
    ],
  });
  return template;
}
