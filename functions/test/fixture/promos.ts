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
  promo_category_id: "best_buy",
  promo_category_name: "Best Buy",
  promo_end: "06/01",
  promo_id: "test_promo",
  promo_name: "Test Promo",
  promo_rate: 5.0,
  promo_repeat_pattern: "annual",
  promo_start: "03/01",
  promo_type: "brand",
};

export const BasicPromoAlternativeInDatabase = {
  promo_category_id: "best_buy",
  promo_category_name: "Best Buy",
  promo_end: "06/01",
  promo_id: "test_promo_alternative",
  promo_name: "Test Promo",
  promo_rate: 5.0,
  promo_repeat_pattern: "annual",
  promo_start: "03/01",
  promo_type: "brand",
};
