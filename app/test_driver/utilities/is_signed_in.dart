import 'package:flutter_driver/flutter_driver.dart';

Future<bool> isSignedIn(FlutterDriver driver) async {
  try {
    await driver.waitFor(find.byValueKey('home_screen_appbar'),
        timeout: Duration(seconds: 20));
    print('Found shop now title, the app is signed in.');
    return true;
  } catch (err) {
    print('Shop now title not found, the app is not signed in.');
    return false;
  }
}
