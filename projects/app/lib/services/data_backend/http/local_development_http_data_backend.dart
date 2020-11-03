import 'package:iwfpapp/services/data_backend/http/base_http_data_backend.dart';

class LocalDevelopmentHttpDataBackend extends BaseHttpDataBackend {
  String loggingNamspace;
  String baseEndpoint;
  String creditCardCreationEndpoint;
  String creditCardFetchEndpoint;
  String creditCardRemovalEndpoint;
  String promotionAdditionEndpoint;
  String promotionRemovalEndpoint;

  LocalDevelopmentHttpDataBackend() {
    baseEndpoint = 'http://localhost:3000/api';
    String creditCardScope = baseEndpoint + '/card';
    creditCardCreationEndpoint = creditCardScope + '/add';
    creditCardFetchEndpoint = creditCardScope + '/fetch';
    creditCardRemovalEndpoint = creditCardScope + '/remove';
    String promotionScope = baseEndpoint + '/promo';
    promotionAdditionEndpoint = promotionScope + '/add';
    promotionRemovalEndpoint = promotionScope + '/remove';
    loggingNamspace = 'service.data_backend.http.local_development';
  }

  @override
  String getCreditCardCreationEndpoint() {
    return creditCardCreationEndpoint;
  }

  @override
  String getCreditCardFetchEndpoint() {
    return creditCardFetchEndpoint;
  }

  @override
  String getLoggingNamespace() {
    return loggingNamspace;
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
}
