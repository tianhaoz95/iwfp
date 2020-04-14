import 'dart:convert';

import 'package:iwfpapp/services/config/consts/endpoints.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:http/http.dart' as http;
import 'package:iwfpapp/services/utilities/converters/data2cards.dart';
import 'package:iwfpapp/services/utilities/converters/token2get_cards_request.dart';

/// Since the in-app SDK has all the support required, the
/// http variant is currently deprecated. It will remain in
/// the code for a while until we are sure that there is no
/// future use cases for it.
class UseHttpDataBackend extends DataBackend {
  UseHttpDataBackend() : super();

  @override
  Future<void> addCreditCardToDatabase(
      CreditCardAdditionRequest req) async {
    return;
  }

  @override
  Future<BackendResponse> addPromitionToDatabase(
      PromotionAdditionRequest req) async {
    http.Response response = await http.post(AddPromotionEndpoint, body: {
      'cardUid': req.target,
      'promoName': req.promo.name,
      'promoId': req.promo.id,
      'promoType': req.promo.type,
      'promoStart': req.promo.start,
      'promoEnd': req.promo.end,
      'promoRepeat': req.promo.repeat,
      'promoRate': req.promo.rate.toString(),
      'promoCategoryName': req.promo.category.name,
      'promoCategoryId': req.promo.category.id,
      'token': token
    });
    if (response.statusCode == 200) {
      return BackendResponse(ResponseStatus.SUCCEESS, 'na');
    } else {
      return BackendResponse(
          ResponseStatus.FAILURE, response.statusCode.toString());
    }
  }

  @override
  Future<void> deleteAccountFromDatabase() async {
    http.Response response =
        await http.post(DeleteAccountEndpoint, body: {'token': token});
    if (response.statusCode != 200) {
      throw 'wtf';
    }
  }

  /// Query the credit cards of a user through http request
  /// with a user authentication token in the request to
  /// authenticate the request.
  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    String request = token2getCardsRequest(token);
    http.Response response = await http.get(request);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      return docs2cards(responseData);
    } else {
      print('Get cards http request failed with ' +
          response.statusCode.toString());
      return [];
    }
  }

  @override
  Future<void> initCreditCardInDatabase(
      CreditCardInitRequest req) async {
    http.Response response = await http.post(AddCreditCardEndpoint,
        body: {'id': req.card.id, 'name': req.card.name, 'token': token});
    if (response.statusCode != 200) {
      throw 'init_credit_card_failed';
    }
  }

  /// Remove a credit card from a users wallet by triggering
  /// the remove credit card http API
  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    http.Response response = await http
        .post(RemoveCreditCardEndpoint, body: {'id': req.id, 'token': token});
    if (response.statusCode != 200) {
      throw 'remove_credit_card_failed';
    }
  }

  @override
  Future<void> removePromotionFromDatabase(
      PromotionRemovalRequest req) async {
    http.Response response = await http.post(RemovePromotionEndpoint,
        body: {'cardUid': req.target, 'promoId': req.id, 'token': token});
    if (response.statusCode != 200) {
      throw 'remove_promo_failed';
    }
  }
}
