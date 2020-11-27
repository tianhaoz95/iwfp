import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/interfaces/response.pb.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/request.pb.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

abstract class BaseHttpDataBackend extends DataBackend {
  @protected
  String getLoggingNamespace();

  @protected
  String getCreditCardCreationEndpoint();

  @protected
  String getCreditCardFetchEndpoint();

  @protected
  String getCreditCardRemovalEndpoint();

  @protected
  String getPromotionAdditionEndpoint();

  @protected
  String getPromotionRemovalEndpoint();

  @protected
  String getDeleteAccountEndpoint();

  void logTrace(String info, {Object error, bool exception = false}) {
    developer.log(info, name: getLoggingNamespace(), error: error);
    if (exception) {
      throw (info);
    }
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

  HttpBasedResponse parseHttpBasedResponse(String body) {
    logTrace('Server responded with ${body}.');
    Map<String, dynamic> resContent = jsonDecode(body);
    logTrace('Server response decoded as JSON.');
    List<int> resBuffer =
        (resContent['proto'] as List<dynamic>).map((e) => e as int).toList();
    HttpBasedResponse response = HttpBasedResponse.fromBuffer(resBuffer);
    return response;
  }

  void maybePostException(HttpBasedResponse response) {
    switch (response.status) {
      case HttpBasedResponse_Status.SUCCESS:
        logTrace('HTTP responded with SUCCESS.');
        break;
      case HttpBasedResponse_Status.ERROR:
        logTrace('HTTP responded with ERROR', error: response.error);
        break;
      case HttpBasedResponse_Status.UNKNOWN:
        logTrace('HTTP responded with UNKNOWN.');
        break;
      default:
        logTrace('Unknown HTTP response status.');
    }
  }

  Future<HttpBasedResponse> sendRequest(
      HttpBasedRequest req, String endpoint) async {
    List<int> buffer = req.writeToBuffer();
    logTrace('Proto request converted to bytes buffer. Send to ${endpoint}.');
    http.Response res =
        await http.post(endpoint, body: {'proto': buffer.toString()});
    logTrace('Server response received.');
    HttpBasedResponse response = parseHttpBasedResponse(res.body);
    logTrace('Server response parsed.');
    return response;
  }

  @override
  Future<void> addCreditCardToDatabase(CreditCardCreationRequest req) async {
    HttpBasedRequest httpRequest = buildHttpBasedRequest();
    httpRequest.creditCardCreationRequest = req;
    HttpBasedResponse response =
        await sendRequest(httpRequest, getCreditCardCreationEndpoint());
    maybePostException(response);
  }

  @override
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
    HttpBasedRequest httpRequest = buildHttpBasedRequest();
    httpRequest.promotionAdditionRequest = req;
    HttpBasedResponse response =
        await sendRequest(httpRequest, getPromotionAdditionEndpoint());
    maybePostException(response);
  }

  @override
  Future<void> deleteAccountFromDatabase() async {
    // TODO(tianhaoz95): there should be a way for data backend to access
    // authentication information.
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    logTrace('Fetch credit cards through HTTP request');
    HttpBasedRequest httpRequest = buildHttpBasedRequest();
    httpRequest.creditCardFetchRequest = CreditCardFetchRequest();
    logTrace('Fetch credit cards request composed');
    HttpBasedResponse response =
        await sendRequest(httpRequest, getCreditCardFetchEndpoint());
    logTrace('Fetch credit cards response received');
    maybePostException(response);
    return response.getCreditCardResponse.cards;
  }

  @override
  Future<void> initCreditCardInDatabase(CreditCardCreationRequest req) async {
    // TODO(tianhaoz95): this should be deprecated in favor of
    // the addCreditCardToDatabase API.
    HttpBasedRequest httpRequest = buildHttpBasedRequest();
    httpRequest.creditCardCreationRequest = req;
    HttpBasedResponse response =
        await sendRequest(httpRequest, getCreditCardCreationEndpoint());
    maybePostException(response);
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardCreationRequest req) async {
    // TODO(tianhaoz95): this should be deprecated in favor of
    // the addCreditCardToDatabase API.
    HttpBasedRequest httpRequest = buildHttpBasedRequest();
    httpRequest.creditCardCreationRequest = req;
    HttpBasedResponse response =
        await sendRequest(httpRequest, getCreditCardCreationEndpoint());
    maybePostException(response);
  }

  @override
  Future<void> initialize() async {
    await Future.delayed(Duration(milliseconds: 200));
    // TODO(tianhaoz95): this is probably a good place to check the
    // version compatibility of app and server.
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    HttpBasedRequest httpRequest = buildHttpBasedRequest();
    httpRequest.creditCardRemovalRequest = req;
    HttpBasedResponse response =
        await sendRequest(httpRequest, getCreditCardRemovalEndpoint());
    maybePostException(response);
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    HttpBasedRequest httpRequest = buildHttpBasedRequest();
    httpRequest.promotionRemovalRequest = req;
    HttpBasedResponse response =
        await sendRequest(httpRequest, getPromotionRemovalEndpoint());
    maybePostException(response);
  }
}
