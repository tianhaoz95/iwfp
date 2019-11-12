import { noAuthMsg, notImplementedError } from "../config/consts";

function RemovePromoHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      reject(notImplementedError);
    } else {
      reject(noAuthMsg);
    }
  });
}

export default RemovePromoHandler;
