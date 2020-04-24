import { AddPromoRequest, RemovePromoRequest, Promo } from "../../config/typedefs";

export function parseRemovePromoRequest(req: any): RemovePromoRequest {
  const removePromoRequest: RemovePromoRequest = {
    valid: true,
    card: "na",
    promo: "na"
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

export function parsePromo(req: any): Promo {
  const promo: Promo = {
    id: "na",
    name: "na",
    type: "na",
    start: "na",
    end: "na",
    repeat: "na",
    rate: "0",
    category: {
      id: "na",
      name: "na",
    }
  }
  let valid: boolean = true;
  if (req.promoId) {
    promo.id = req.promoId;
  } else {
    valid = false;
  }
  if(req.promoName) {
    promo.name = req.promoName;
  } else {
    valid = false;
  }
  if(req.promoType) {
    promo.type = req.promoType;
  } else {
    valid = false;
  }
  if(req.promoStart) {
    promo.start = req.promoStart;
  } else {
    valid = false;
  }
  if(req.promoEnd) {
    promo.end = req.promoEnd;
  } else {
    valid = false;
  }
  if(req.promoRepeat) {
    promo.repeat = req.promoRepeat;
  } else {
    valid = false;
  }
  if(req.promoRate) {
    promo.rate = req.promoRate;
  } else {
    valid = false;
  }
  if(req.promoCategoryId) {
    promo.category.id = req.promoCategoryId;
  } else {
    valid = false;
  }
  if(req.promoCategoryName) {
    promo.category.name = req.promoCategoryName;
  } else {
    valid = false;
  }
  if (!valid) {
    throw new Error('promo parsing failed');
  }
  return promo;
}

export function parseAddPromoRequest(req: any): AddPromoRequest {
  const addPromoRequest: AddPromoRequest = {
    valid: true,
    card: "na",
    promo: {
      id: "na",
      name: "na",
      type: "na",
      start: "na",
      end: "na",
      repeat: "na",
      rate: "0",
      category: {
        id: "na",
        name: "na",
      }
    }
  };
  if (req.cardUid) {
    addPromoRequest.card = req.cardUid;
  } else {
    addPromoRequest.valid = false;
  }
  try {
    const promo: Promo = parsePromo(req);
    addPromoRequest.promo = promo;
  } catch (err) {
    addPromoRequest.valid = false;
  }
  return addPromoRequest;
}