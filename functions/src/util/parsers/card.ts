import {
  CardCreationRequest,
  CardRemovalRequest,
  CardEditRequest,
  CardCreationWithTemplateRequest,
} from "../../config/typedefs";
import { parseAddPromoRequest } from "./promo";

export function parseCardCreationWithTemplateRequest(
  req: any
): CardCreationWithTemplateRequest {
  const cardCreationWithTemplateRequest: CardCreationWithTemplateRequest = {
    valid: true,
    id: "na",
    name: "na",
    promos: [],
  };
  cardCreationWithTemplateRequest.name = req.name;
  cardCreationWithTemplateRequest.id = req.id;
  for (const promo of req.promos) {
    cardCreationWithTemplateRequest.promos.push(parseAddPromoRequest(promo));
  }
  return cardCreationWithTemplateRequest;
}

export function parseCardCreationRequest(req: any): CardCreationRequest {
  const cardCreateRequest: CardCreationRequest = {
    valid: true,
    id: "na",
    name: "na",
  };
  if (req.name) {
    cardCreateRequest.name = req.name;
  } else {
    cardCreateRequest.valid = false;
    cardCreateRequest.name = "na";
  }
  if (req.id) {
    cardCreateRequest.id = req.id;
  } else {
    cardCreateRequest.valid = false;
    cardCreateRequest.id = "na";
  }
  return cardCreateRequest;
}

export function parseCardRemovalRequest(req: any): CardRemovalRequest {
  const cardRemovalRequst: CardRemovalRequest = {
    valid: true,
    id: "na",
  };
  if (req.id) {
    cardRemovalRequst.valid = true;
    cardRemovalRequst.id = req.id;
  } else {
    cardRemovalRequst.valid = false;
    cardRemovalRequst.id = "na";
  }
  return cardRemovalRequst;
}

export function parseCardEditRequest(req: any): CardEditRequest {
  const cardEditRequest: CardCreationRequest = {
    valid: true,
    id: "na",
    name: "na",
  };
  if (req.cardUid) {
    cardEditRequest.id = req.cardUid;
  } else {
    cardEditRequest.valid = false;
  }
  if (req.cardData) {
    cardEditRequest.name = req.cardData;
  } else {
    cardEditRequest.valid = false;
  }
  return cardEditRequest;
}
