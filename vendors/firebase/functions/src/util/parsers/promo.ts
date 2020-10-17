import {
  Promotion,
  PromotionRemovalRequest,
  PromotionAdditionRequest,
} from "../../interfaces/interfaces";

export function parseRemovePromoRequest(req: any): PromotionRemovalRequest {
  const promotionRemovalRequest: PromotionRemovalRequest = PromotionRemovalRequest.fromObject(
    req
  );
  return promotionRemovalRequest;
}

export function parsePromo(req: any): Promotion {
  const promotion: Promotion = Promotion.fromObject(req);
  return promotion;
}

export function parseAddPromoRequest(req: any): PromotionAdditionRequest {
  const promotionAdditionRequest: PromotionAdditionRequest = PromotionAdditionRequest.fromObject(
    req
  );
  return promotionAdditionRequest;
}
