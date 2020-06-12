import { noAuthMsg } from "../config/consts";
import { FunctionContext } from "../config/typedefs";
import { PromotionAdditionRequest, Promotion } from "../interfaces/interfaces";
import { setPromotion } from "./setters/set_promotion";
import { PromotionDataMissingError } from "../config/errors";

async function addPromoHandler(
  data: PromotionAdditionRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    if (data.promotionData) {
      await setPromotion(
        context.uid,
        data.targetCardId,
        Promotion.create(data.promotionData),
        provider
      );
    } else {
      throw PromotionDataMissingError;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addPromoHandler;
