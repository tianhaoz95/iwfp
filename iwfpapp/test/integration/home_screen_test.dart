import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/config/typedefs/user_account.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/context.dart';
import 'package:iwfpapp/screens/home/main.dart';
import 'mock_services/mock_auth.dart';
import 'mock_services/mock_context.dart';
import 'mock_services/mock_data_store.dart';

void main() {
  testWidgets('test home screen render no crash', (WidgetTester tester) async {
    AppContext mockedAppContext = MockAppContext();
    IwfpappAuth mockAuth = MockIwfpappAuth(
        overrideUser:
            UserAccount(email: 'test@iwfp.com', password: 'Wtf#12345'));
    DataStore mockDataStore = MockDataStore();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(mockedAppContext, mockDataStore, mockAuth),
    ));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
  });
}
