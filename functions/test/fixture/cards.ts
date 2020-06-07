import { CreditCard } from "../../src/interfaces/interfaces";
import { createBasicPromotion } from "./promos";

export const testCreditCard: CreditCard = CreditCard.create({
  id: "test_card_id",
  displayName: "test_card_name",
});

export const testCreditCardTemplate: CreditCard = CreditCard.create({
  id: "test_card_id",
  displayName: "test_card_name",
  promotions: [
    createBasicPromotion(),
    createBasicPromotion("test_promo_alternative"),
  ],
});
