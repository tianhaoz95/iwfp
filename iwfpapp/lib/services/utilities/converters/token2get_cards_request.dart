import 'package:iwfpapp/services/config/consts/endpoints.dart';

/// Converts user authentication token to get credit card
/// http query request.
String token2getCardsRequest(String token) {
  String request = GetCreditCardsEndpoint + '?token=' + token;
  return request;
}