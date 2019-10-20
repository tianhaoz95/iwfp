import 'package:flutter/material.dart';
import 'nav.dart';
import 'screens/login/main.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:iwfpapp/screens/placeholder/main.dart';

void main() {
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iwfp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/main': (context) => DestView(),
        '/placeholder': (context) => PlaceholderScreen(),
      },
    );
  }
}
