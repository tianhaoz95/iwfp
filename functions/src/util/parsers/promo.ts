import {
  ShoppingCategory,
  Promotion,
  PromotionRemovalRequest,
  PromotionAdditionRequest,
} from "../../interfaces/interfaces";

export function parseRemovePromoRequest(req: any): PromotionRemovalRequest {
  const promotionRemovalRequest: PromotionRemovalRequest = PromotionRemovalRequest.create(
    {
      targetCardId: "na",
      targetPromotionId: "na",
    }
  );
  if (req.cardUid) {
    promotionRemovalRequest.targetCardId = req.cardUid;
  } else {
    promotionRemovalRequest.valid = false;
  }
  if (req.promoId) {
    promotionRemovalRequest.targetPromotionId = req.promoId;
  } else {
    promotionRemovalRequest.valid = false;
  }
  return promotionRemovalRequest;
}

export function parsePromo(req: any): Promotion {
  const promotion: Promotion = Promotion.create({
    id: "na",
    displayName: "na",
    type: "na",
    startDate: "na",
    endDate: "na",
    repeatPattern: "na",
    rate: 0.0,
    category: ShoppingCategory.create({
      id: "na",
      displayName: "na",
    }),
  });
  let valid: boolean = true;
  if (req.promoId) {
    promotion.id = req.promoId;
  } else {
    valid = false;
  }
  if (req.promoName) {
    promotion.displayName = req.promoName;
  } else {
    valid = false;
  }
  if (req.promoType) {
    promotion.type = req.promoType;
  } else {
    valid = false;
  }
  if (req.promoStart) {
    promotion.startDate = req.promoStart;
  } else {
    valid = false;
  }
  if (req.promoEnd) {
    promotion.endDate = req.promoEnd;
  } else {
    valid = false;
  }
  if (req.promoRepeat) {
    promotion.repeatPattern = req.promoRepeat;
  } else {
    valid = false;
  }
  if (req.promoRate) {
    promotion.rate = req.promoRate;
  } else {
    valid = false;
  }
  if (req.promoCategoryId && promotion.category) {
    promotion.category.id = req.promoCategoryId;
  } else {
    valid = false;
  }
  if (req.promoCategoryName && promotion.category) {
    promotion.category.displayName = req.promoCategoryName;
  } else {
    valid = false;
  }
  if (!valid) {
    throw new Error("promo parsing failed");
  }
  return promotion;
}

export function parseAddPromoRequest(req: any): PromotionAdditionRequest {
  const promotionAdditionRequest: PromotionAdditionRequest = PromotionAdditionRequest.create(
    {
      valid: true,
      targetCardId: "na",
      promotionData: Promotion.create({
        id: "na",
        displayName: "na",
        type: "na",
        startDate: "na",
        endDate: "na",
        repeatPattern: "na",
        rate: 0.0,
        category: ShoppingCategory.create({
          id: "na",
          displayName: "na",
        }),
      }),
    }
  );
  if (req.cardUid) {
    promotionAdditionRequest.targetCardId = req.cardUid;
  } else {
    promotionAdditionRequest.valid = false;
  }
  try {
    const promo: Promotion = parsePromo(req);
    promotionAdditionRequest.promotionData = promo;
  } catch (err) {
    promotionAdditionRequest.valid = false;
  }
  return promotionAdditionRequest;
}
