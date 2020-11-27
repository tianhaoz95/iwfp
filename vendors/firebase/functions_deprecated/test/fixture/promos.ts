import { Promotion, ShoppingCategory } from "../../src/interfaces/interfaces";

export function createBasicPromotion(id?: string): Promotion {
  const promo = Promotion.create({
    id: "test_promo",
    displayName: "Test Promo",
    type: "brand",
    startDate: "03/01",
    endDate: "06/01",
    repeatPattern: "annual",
    rate: 5.0,
    category: ShoppingCategory.create({
      id: "best_buy",
      displayName: "Best Buy",
    }),
  });
  if (id) {
    promo.id = id;
  }
  return promo;
}

export const BasicPromo = {
  cardUid: "test_card_uid",
  promoId: "test_promo",
  promoName: "Test Promo",
  promoType: "brand",
  promoStart: "03/01",
  promoEnd: "06/01",
  promoRepeat: "annual",
  promoRate: "5",
  promoCategoryId: "best_buy",
  promoCategoryName: "Best Buy",
};

export const BasicPromoAlternative = {
  cardUid: "test_card_uid",
  promoId: "test_promo_alternative",
  promoName: "Test Promo Alternative",
  promoType: "brand",
  promoStart: "03/01",
  promoEnd: "06/01",
  promoRepeat: "annual",
  promoRate: "5",
  promoCategoryId: "amazon",
  promoCategoryName: "Amazon",
};

export const HttpSimpleAddPromoRequest = {
  token: "test_token",
  cardUid: "test_card_uid",
  promoId: "test_promo",
  promoName: "Test Promo",
  promoType: "brand",
  promoStart: "03/01",
  promoEnd: "06/01",
  promoRepeat: "annual",
  promoRate: 5.0,
  promoCategoryId: "best_buy",
  promoCategoryName: "Best Buy",
};

export const BasicPromoInDatabase = {
  category: {
    displayName: "Best Buy",
    id: "best_buy",
  },
  endDate: "06/01",
  id: "test_promo",
  displayName: "Test Promo",
  rate: 5.0,
  repeatPattern: "annual",
  startDate: "03/01",
  type: "brand",
};

export const BasicPromoAlternativeInDatabase = {
  category: {
    displayName: "Best Buy",
    id: "best_buy",
  },
  endDate: "06/01",
  id: "test_promo_alternative",
  displayName: "Test Promo",
  rate: 5.0,
  repeatPattern: "annual",
  startDate: "03/01",
  type: "brand",
};
