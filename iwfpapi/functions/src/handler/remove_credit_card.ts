import provider from "../provider";
import { noAuthMsg } from "../config/consts";

function RemoveCreditCardHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      // todo implement remove card
    } else {
      reject(noAuthMsg);
    }
  });
}
