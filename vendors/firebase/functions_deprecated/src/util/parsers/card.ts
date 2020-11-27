import {
  CreditCardRemovalRequest,
  CreditCardCreationRequest,
  CreditCardUpdateRequest,
} from "../../interfaces/interfaces";

export function parseCardCreationWithTemplateRequest(
  req: any
): CreditCardCreationRequest {
  const creditCardCreationRequest: CreditCardCreationRequest = CreditCardCreationRequest.fromObject(
    req
  );
  return creditCardCreationRequest;
}

export function parseCardCreationRequest(req: any): CreditCardCreationRequest {
  console.log(req);
  const creditCardCreationRequest: CreditCardCreationRequest = CreditCardCreationRequest.fromObject(
    req
  );
  return creditCardCreationRequest;
}

export function parseCardRemovalRequest(req: any): CreditCardRemovalRequest {
  const creditCardRemovalRequest: CreditCardRemovalRequest = CreditCardRemovalRequest.fromObject(
    req
  );
  return creditCardRemovalRequest;
}

export function parseCardEditRequest(req: any): CreditCardUpdateRequest {
  const creditCardCreationRequest: CreditCardUpdateRequest = CreditCardUpdateRequest.fromObject(
    req
  );
  return creditCardCreationRequest;
}
