import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';

Future<List<CreditCard>> fetchAllCreditCards(String uid) {
  List<CreditCard> creditCardMetadataList = [
    CreditCard('Chase Freedom'),
    CreditCard('Discover Credit Card'),
    CreditCard('Discover Cashback Debit Card'),
    CreditCard('Empower Cashback Debit Card'),
  ];
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
