import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';

class DataStore {
  List<ShopCategory> categories = [];
  List<CreditCard> cards = [];
  String serviceType;
  DataStore(this.serviceType);
}