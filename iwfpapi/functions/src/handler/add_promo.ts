import { noAuthMsg, notImplementedError } from "../config/consts";

function AddPromoHandler(data, context) {
  return new Promise((resolve, reject) => {
    if (context.auth) {
      reject(notImplementedError);
    } else {
      reject(noAuthMsg);
    }
  });
}

export default AddPromoHandler;
