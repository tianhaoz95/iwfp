export interface CardData {
  valid: boolean;
  id: string;
  name: string;
}

export interface FunctionContext {
  authenticated: boolean;
  uid: string;
}
