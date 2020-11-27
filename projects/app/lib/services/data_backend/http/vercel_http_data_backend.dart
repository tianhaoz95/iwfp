import 'package:flutter/cupertino.dart';
import 'package:iwfpapp/services/data_backend/http/base_http_data_backend.dart';

abstract class VercelHttpDataBackend extends BaseHttpDataBackend {
  String baseEndpoint;
  String creditCardCreationEndpoint;
  String creditCardFetchEndpoint;
  String creditCardRemovalEndpoint;
  String promotionAdditionEndpoint;
  String promotionRemovalEndpoint;
  String deleteAccountEndpoint;

  VercelHttpDataBackend() : super() {
    baseEndpoint = getBaseEndpoint();
    String creditCardScope = baseEndpoint + '/card';
    creditCardCreationEndpoint = creditCardScope + '/add';
    creditCardFetchEndpoint = creditCardScope + '/fetch';
    creditCardRemovalEndpoint = creditCardScope + '/remove';
    String promotionScope = baseEndpoint + '/promo';
    promotionAdditionEndpoint = promotionScope + '/add';
    promotionRemovalEndpoint = promotionScope + '/remove';
    String userScope = baseEndpoint + '/user';
    deleteAccountEndpoint = userScope + '/remove';
  }

  @protected
  String getBaseEndpoint();

  @override
  String getCreditCardCreationEndpoint() {
    return creditCardCreationEndpoint;
  }

  @override
  String getCreditCardFetchEndpoint() {
    return creditCardFetchEndpoint;
  }

  @override
  String getCreditCardRemovalEndpoint() {
    return creditCardRemovalEndpoint;
  }

  @override
  String getPromotionAdditionEndpoint() {
    return promotionAdditionEndpoint;
  }

  @override
  String getPromotionRemovalEndpoint() {
    return promotionRemovalEndpoint;
  }

  @override
  String getDeleteAccountEndpoint() {
    return deleteAccountEndpoint;
  }
}
