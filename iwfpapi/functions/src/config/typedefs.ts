export interface CardCreationRequest {
  valid: boolean;
  id: string;
  name: string;
}

export interface CardRemovalRequest {
  valid: boolean;
  id: string;
}

export interface FunctionContext {
  authenticated: boolean;
  uid: string;
}
