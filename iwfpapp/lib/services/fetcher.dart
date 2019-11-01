import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/cashback_promo.dart';

void populateChaseCreditCard(CreditCard card) {
  card.promos.add(CashbackPromo(
      'Gas Station', 'gas_stations', 'sector', '01/01', '03/31', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Grag Stores', 'drag_stores', 'sector', '01/01', '03/31', 'annual', 5));
  card.promos.add(CashbackPromo('Grocery Stores', 'grocery_stores', 'sector',
      '04/01', '06/30', 'annual', 5));
  card.promos.add(CashbackPromo('Home Improvement Stores',
      'home_improvement_stores', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Gas Stations', 'gas_stations', 'sector', '07/01', '09/30', 'annual', 5));
  card.promos.add(CashbackPromo('Streaming Services', 'streaming_services',
      'sector', '07/01', '09/30', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Chase Pay', 'chase_pay', 'payment', '10/01', '12/31', 'annual', 5));
  card.promos.add(CashbackPromo(
      'PayPal', 'paypal', 'payment', '10/01', '12/31', 'annual', 5));
  card.promos.add(CashbackPromo(
      'All Purchases', 'all_purchase', 'universal', 'nan', 'nan', 'const', 1));
}

void populateDiscoverCreditCard(CreditCard card) {
  card.promos.add(CashbackPromo('Grocery Stores', 'grocery_stores', 'sector',
      '01/01', '03/31', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Gas Stations', 'gas_stations', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos.add(
      CashbackPromo('Uber', 'uber', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos.add(
      CashbackPromo('Lyft', 'lyft', 'sector', '04/01', '06/30', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Restaurants', 'restaurants', 'sector', '07/01', '09/30', 'annual', 5));
  card.promos.add(CashbackPromo(
      'PayPal', 'paypal', 'payment', '07/01', '09/30', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Amazon.com', 'amazon', 'brand', '10/01', '12/31', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Target', 'target', 'brand', '10/01', '12/31', 'annual', 5));
  card.promos.add(CashbackPromo(
      'Walmart', 'walmart', 'brand', '10/01', '12/31', 'annual', 5));
  card.promos.add(CashbackPromo(
      'All Purchases', 'all_purchase', 'universal', 'nan', 'nan', 'const', 1));
}

void populateDebitCard(CreditCard card) {
  card.promos.add(CashbackPromo(
      'All Purchases', 'all_purchase', 'universal', 'nan', 'nan', 'const', 1));
}

void populateAmazonStoreCard(CreditCard card) {
  card.promos.add(
      CashbackPromo('Amazon.com', 'amazon', 'brand', 'nan', 'nan', 'const', 5));
}

Future<List<CreditCard>> fetchAllCreditCards(String uid) {
  List<CreditCard> creditCardMetadataList = [
    CreditCard('Discover Cashback Debit Card'),
    CreditCard('Empower Cashback Debit Card'),
    CreditCard('Chase Freedom'),
    CreditCard('Amazon Store Card'),
    CreditCard('Discover Credit Card'),
  ];
  populateDebitCard(creditCardMetadataList[0]);
  populateDebitCard(creditCardMetadataList[1]);
  populateChaseCreditCard(creditCardMetadataList[2]);
  populateAmazonStoreCard(creditCardMetadataList[3]);
  populateDiscoverCreditCard(creditCardMetadataList[4]);
  return Future.delayed(Duration(seconds: 1), () => creditCardMetadataList);
}

Future<List<ShopCategory>> fetchAllShopCategories(String uid) {
  List<ShopCategory> suggestions = [
    ShopCategory('Samsung Pay', 'samsung_pay'),
    ShopCategory('Drag Stores', 'drag_stores'),
    ShopCategory('Paypal', 'paypal'),
    ShopCategory('Uber', 'uber'),
    ShopCategory('Lyft', 'lyft'),
    ShopCategory('Grocery Stores', 'grocery_stores'),
    ShopCategory('Restaurants', 'restaurants'),
    ShopCategory('Amazon.com', 'amazon'),
    ShopCategory('Walmart', 'walmart'),
    ShopCategory('Target', 'target'),
    ShopCategory('Macy', 'macy'),
    ShopCategory('Home Improvement Stores', 'home_improvement_stores'),
    ShopCategory('Chase Pay', 'chase_pay'),
    ShopCategory('Gas Station', 'gas_stations'),
  ];
  return Future.delayed(Duration(seconds: 1), () => suggestions);
}
