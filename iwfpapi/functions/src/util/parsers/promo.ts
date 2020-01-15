import { AddPromoRequest, RemovePromoRequest } from "../../config/typedefs";

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
  if (req.promoId) {
    addPromoRequest.promo.id = req.promoId;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoName) {
    addPromoRequest.promo.name = req.promoName;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoType) {
    addPromoRequest.promo.type = req.promoType;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoStart) {
    addPromoRequest.promo.start = req.promoStart;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoEnd) {
    addPromoRequest.promo.end = req.promoEnd;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoRepeat) {
    addPromoRequest.promo.repeat = req.promoRepeat;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoRate) {
    addPromoRequest.promo.rate = req.promoRate;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoCategoryId) {
    addPromoRequest.promo.category.id = req.promoCategoryId;
  } else {
    addPromoRequest.valid = false;
  }
  if(req.promoCategoryName) {
    addPromoRequest.promo.category.name = req.promoCategoryName;
  } else {
    addPromoRequest.valid = false;
  }
  return addPromoRequest;
}