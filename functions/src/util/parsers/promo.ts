import { AddPromoRequest, RemovePromoRequest } from "../../config/typedefs";
import { ShoppingCategory, Promotion } from "../../interfaces/interfaces";

export function parseRemovePromoRequest(req: any): RemovePromoRequest {
  const removePromoRequest: RemovePromoRequest = {
    valid: true,
    card: "na",
    promo: "na",
  };
  if (req.cardUid) {
    removePromoRequest.card = req.cardUid;
  } else {
    removePromoRequest.valid = false;
  }
  if (req.promoId) {
    removePromoRequest.promo = req.promoId;
  } else {
    removePromoRequest.valid = false;
  }
  return removePromoRequest;
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

export function parseAddPromoRequest(req: any): AddPromoRequest {
  const addPromoRequest: AddPromoRequest = {
    valid: true,
    card: "na",
    promo: Promotion.create({
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
  };
  if (req.cardUid) {
    addPromoRequest.card = req.cardUid;
  } else {
    addPromoRequest.valid = false;
  }
  try {
    const promo: Promotion = parsePromo(req);
    addPromoRequest.promo = promo;
  } catch (err) {
    addPromoRequest.valid = false;
  }
  return addPromoRequest;
}
