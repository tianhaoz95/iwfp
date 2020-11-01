import 'dart:convert';
// import 'dart:typed_data';

import 'package:iwfpapp/services/interfaces/response.pb.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/request.pb.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:http/http.dart' as http;

class HttpDataBackend extends DataBackend {
  String endpoint;

  HttpDataBackend() {
    endpoint = 'http://localhost:3000';
  }

  HttpBasedCredential buildCredential() {
    HttpBasedCredential cred = HttpBasedCredential();
    cred.token = 'test_token';
    return cred;
  }

  HttpBasedVersionInfo buildVersionInfo() {
    HttpBasedVersionInfo versionInfo = HttpBasedVersionInfo();
    versionInfo.serviceType = HttpBasedVersionInfo_ServiceType.FIREBASE;
    return versionInfo;
  }

  void populateHttpBasedRequest(HttpBasedRequest req) {
    req.credential = buildCredential();
    req.versionInfo = buildVersionInfo();
  }

  HttpBasedRequest buildHttpBasedRequest() {
    HttpBasedRequest req = HttpBasedRequest();
    populateHttpBasedRequest(req);
    return req;
  }

  @override
  Future<void> addCreditCardToDatabase(CreditCardCreationRequest req) async {
    HttpBasedRequest httpRequest = HttpBasedRequest();
    httpRequest.credential = buildCredential();
    httpRequest.versionInfo = buildVersionInfo();
    httpRequest.creditCardCreationRequest = req;
    List<int> buffer = httpRequest.writeToBuffer();
    // String strBuffer = utf8.decode(buffer);
    http.Response res = await http
        .post(endpoint + '/api/card/add', body: {'proto': buffer.toString()});
    HttpBasedResponse response = HttpBasedResponse.fromJson(res.body);
    if (response.status != HttpBasedResponse_Status.SUCCESS) {
      throw ('Add credit card failed.');
    }
  }

  @override
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> deleteAccountFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    HttpBasedRequest httpRequest = HttpBasedRequest();
    httpRequest.credential = buildCredential();
    httpRequest.versionInfo = buildVersionInfo();
    httpRequest.creditCardFetchRequest = CreditCardFetchRequest();
    List<int> buffer = httpRequest.writeToBuffer();
    // String strBuffer = utf8.decode(buffer);
    http.Response res = await http
        .post(endpoint + '/api/card/fetch', body: {'proto': buffer.toString()});
    HttpBasedResponse response = HttpBasedResponse.fromJson(res.body);
    if (response.status != HttpBasedResponse_Status.SUCCESS) {
      throw ('Add credit card failed.');
    }
    return response.getCreditCardResponse.cards;
  }

  @override
  Future<void> initCreditCardInDatabase(CreditCardCreationRequest req) async {
    HttpBasedRequest httpRequest = HttpBasedRequest();
    httpRequest.credential = buildCredential();
    httpRequest.versionInfo = buildVersionInfo();
    httpRequest.creditCardCreationRequest = req;
    List<int> buffer = httpRequest.writeToBuffer();
    http.Response res = await http
        .post(endpoint + '/api/card/add', body: {'proto': buffer.toString()});
    HttpBasedResponse response = HttpBasedResponse.fromJson(res.body);
    if (response.status != HttpBasedResponse_Status.SUCCESS) {
      throw ('Add credit card failed.');
    }
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardCreationRequest req) async {
    print('Run initCreditCardWithTemplateInDatabase');
    HttpBasedRequest httpRequest = HttpBasedRequest();
    httpRequest.credential = buildCredential();
    httpRequest.versionInfo = buildVersionInfo();
    httpRequest.creditCardCreationRequest = req;
    print('req composed');
    List<int> buffer = httpRequest.writeToBuffer();
    print('req encoded');
    http.Response res = await http
        .post(endpoint + '/api/card/add', body: {'proto': buffer.toString()});
    HttpBasedResponse response = HttpBasedResponse.fromJson(res.body);
    if (response.status != HttpBasedResponse_Status.SUCCESS) {
      throw ('Add credit card failed.');
    }
  }

  @override
  Future<void> initialize() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }
}
