import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pb.dart';
import 'package:iwfpapp/services/interfaces/request.pbserver.dart';

PromotionRemovalRequest createPromotionRemovalRequest({
  @required String targetCardId,
  @required String targetPromotionId,
}) {
  PromotionRemovalRequest req = PromotionRemovalRequest.create();
  req.targetCardId = targetCardId;
  req.targetPromotionId = targetPromotionId;
  return req;
}

CreditCardRemovalRequest createCreditCardRemovalRequest({
  @required String cardId,
}) {
  CreditCardRemovalRequest req = CreditCardRemovalRequest.create();
  req.cardId = cardId;
  return req;
}

PromotionAdditionRequest createPromotionAdditionRequest({
  @required String targetCardId,
  @required Promotion promotionData,
}) {
  PromotionAdditionRequest req = PromotionAdditionRequest.create();
  req.targetCardId = targetCardId;
  req.promotionData = promotionData;
  return req;
}

CreditCardCreationRequest createCreditCardCreationRequest({
  @required CreditCard cardData,
}) {
  CreditCardCreationRequest req = CreditCardCreationRequest.create();
  req.cardData = cardData;
  return req;
}
