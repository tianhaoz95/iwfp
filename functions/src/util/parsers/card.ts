import { parsePromo } from "./promo";
import {
  CreditCardRemovalRequest,
  CreditCardCreationRequest,
  CreditCard,
  CreditCardUpdateRequest,
} from "../../interfaces/interfaces";

export function parseCardCreationWithTemplateRequest(
  req: any
): CreditCardCreationRequest {
  const creditCardCreationRequest: CreditCardCreationRequest = CreditCardCreationRequest.create(
    {
      valid: true,
      cardData: CreditCard.create({
        id: "na",
        displayName: "na",
      }),
    }
  );
  if (creditCardCreationRequest.cardData) {
    creditCardCreationRequest.cardData.displayName = req.name;
    creditCardCreationRequest.cardData.id = req.id;
  }
  for (const promo of req.promos) {
    creditCardCreationRequest.cardData?.promotions?.push(parsePromo(promo));
  }
  return creditCardCreationRequest;
}

export function parseCardCreationRequest(req: any): CreditCardCreationRequest {
  const creditCardCreationRequest: CreditCardCreationRequest = CreditCardCreationRequest.create(
    {
      valid: true,
      cardData: CreditCard.create({
        id: "na",
        displayName: "na",
      }),
    }
  );
  if (req.name && creditCardCreationRequest.cardData) {
    creditCardCreationRequest.cardData.displayName = req.name;
  } else {
    creditCardCreationRequest.valid = false;
  }
  if (req.id && creditCardCreationRequest.cardData) {
    creditCardCreationRequest.cardData.id = req.id;
  } else {
    creditCardCreationRequest.valid = false;
  }
  return creditCardCreationRequest;
}

export function parseCardRemovalRequest(req: any): CreditCardRemovalRequest {
  const creditCardRemovalRequest: CreditCardRemovalRequest = CreditCardRemovalRequest.create(
    {
      valid: true,
      cardId: "na",
    }
  );
  if (req.id) {
    creditCardRemovalRequest.valid = true;
    creditCardRemovalRequest.cardId = req.id;
  } else {
    creditCardRemovalRequest.valid = false;
    creditCardRemovalRequest.cardId = "na";
  }
  return creditCardRemovalRequest;
}

export function parseCardEditRequest(req: any): CreditCardUpdateRequest {
  const creditCardCreationRequest: CreditCardUpdateRequest = CreditCardUpdateRequest.create(
    {
      valid: true,
      updatedCardData: CreditCard.create({
        id: "na",
        displayName: "na",
      }),
    }
  );
  if (req.cardUid && creditCardCreationRequest.updatedCardData) {
    creditCardCreationRequest.updatedCardData.id = req.cardUid;
  } else {
    creditCardCreationRequest.valid = false;
  }
  if (req.cardData && creditCardCreationRequest.updatedCardData) {
    creditCardCreationRequest.updatedCardData.displayName = req.cardData;
  } else {
    creditCardCreationRequest.valid = false;
  }
  return creditCardCreationRequest;
}
