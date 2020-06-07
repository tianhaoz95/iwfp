import * as firebase from "firebase";
import "firebase/functions";
import {
  CreditCardCreationRequest,
  CreditCard,
} from "../../../src/interfaces/interfaces";

export async function populateWalletWithCreditCard(
  callable: firebase.functions.HttpsCallable,
  card: CreditCard
): Promise<firebase.functions.HttpsCallableResult> {
  const response = await callable(
    CreditCardCreationRequest.create({
      cardData: card,
    }).toJSON()
  );
  return response;
}
