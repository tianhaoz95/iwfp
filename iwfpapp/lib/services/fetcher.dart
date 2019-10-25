import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/cashback_promo.dart';

void populateChaseCreditCard(CreditCard card) {
  card.promos.add(
      CashbackPromo('gas_stations', 'sector', '01/01', '03/31', 'annual', 5));
  card.promos.add(
      CashbackPromo('drag_stores', 'sector', '01/01', '03/31', 'annual', 5));
  card.promos.add(
      CashbackPromo('grocery_stores', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos.add(CashbackPromo(
      'home_improvement_stores', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos.add(
      CashbackPromo('gas_stations', 'sector', '07/01', '09/30', 'annual', 5));
  card.promos.add(CashbackPromo(
      'streaming_services', 'sector', '07/01', '09/30', 'annual', 5));
  card.promos.add(
      CashbackPromo('chase_pay', 'payment', '10/01', '12/31', 'annual', 5));
  card.promos
      .add(CashbackPromo('paypal', 'payment', '10/01', '12/31', 'annual', 5));
  card.promos.add(
      CashbackPromo('all_purchase', 'universal', 'nan', 'nan', 'const', 1));
}

void populateDiscoverCreditCard(CreditCard card) {
  card.promos.add(
      CashbackPromo('grocery_stores', 'sector', '01/01', '03/31', 'annual', 5));
  card.promos.add(
      CashbackPromo('gas_stations', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos
      .add(CashbackPromo('uber', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos
      .add(CashbackPromo('lyft', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos.add(
      CashbackPromo('restaurants', 'sector', '07/01', '09/30', 'annual', 5));
  card.promos
      .add(CashbackPromo('paypal', 'payment', '07/01', '09/30', 'annual', 5));
  card.promos
      .add(CashbackPromo('amazon', 'brand', '10/01', '12/31', 'annual', 5));
  card.promos
      .add(CashbackPromo('target', 'brand', '10/01', '12/31', 'annual', 5));
  card.promos
      .add(CashbackPromo('walmart', 'brand', '10/01', '12/31', 'annual', 5));
  card.promos.add(
      CashbackPromo('all_purchase', 'universal', 'nan', 'nan', 'const', 1));
}

void populateDebitCard(CreditCard card) {
  card.promos.add(
      CashbackPromo('all_purchase', 'universal', 'nan', 'nan', 'const', 1));
}

Future<List<CreditCard>> fetchAllCreditCards(String uid) {
  List<CreditCard> creditCardMetadataList = [
    CreditCard('Chase Freedom'),
    CreditCard('Discover Credit Card'),
    CreditCard('Discover Cashback Debit Card'),
    CreditCard('Empower Cashback Debit Card'),
  ];
  populateChaseCreditCard(creditCardMetadataList[0]);
  populateDiscoverCreditCard(creditCardMetadataList[1]);
  populateDebitCard(creditCardMetadataList[2]);
  populateDebitCard(creditCardMetadataList[3]);
  return Future.delayed(Duration(seconds: 1), () => creditCardMetadataList);
}

Future<List<ShopCategory>> fetchAllShopCategories(String uid) {
  List<ShopCategory> suggestions = [
    ShopCategory('Samsung Pay', 'samsung_pay'),
    ShopCategory('Restaurants', 'restaurants'),
    ShopCategory('Coffee Shop', 'coffee_shop'),
    ShopCategory('Amazon.com', 'amazon'),
    ShopCategory('Walmart', 'walmart'),
    ShopCategory('Macy', 'macy'),
    ShopCategory('Nike', 'nike'),
    ShopCategory('Vans', 'vans'),
    ShopCategory('Hotels', 'hotel'),
    ShopCategory('Apple', 'apple'),
    ShopCategory('Microsoft', 'microsoft'),
    ShopCategory('Google Pay', 'google_pay'),
    ShopCategory('Chase Pay', 'chase_pay'),
    ShopCategory('Gas Station', 'gas_station'),
    ShopCategory('Traveling', 'traveling'),
    ShopCategory('Best Buy', 'best_buy'),
    ShopCategory('Safeway', 'safeway'),
    ShopCategory('CVS', 'cvs'),
    ShopCategory('Great Mall', 'great_mall'),
    ShopCategory('Outlets', 'outlets'),
  ];
  return Future.delayed(Duration(seconds: 1), () => suggestions);
}
