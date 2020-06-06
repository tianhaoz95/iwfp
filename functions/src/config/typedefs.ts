import { Promotion } from "../interfaces/interfaces";

export interface CardCreationRequest {
  valid: boolean;
  id: string;
  name: string;
}

export interface CardCreationWithTemplateRequest {
  valid: boolean;
  id: string;
  name: string;
  promos: AddPromoRequest[];
}

export interface CardRemovalRequest {
  valid: boolean;
  id: string;
}

export interface CardEditRequest {
  valid: boolean;
  id: string;
  name: string;
}

export interface AddPromoRequest {
  valid: boolean;
  card: string /** The ID of the target card */;
  promo: Promotion /** The promo to be added */;
}

export interface RemovePromoRequest {
  valid: boolean;
  card: string /** The ID of the target card */;
  promo: string /** The ID of the target promo */;
}

export interface FunctionContext {
  authenticated: boolean;
  uid: string;
}
