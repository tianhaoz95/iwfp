import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/auth/auth_screen.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'mock_services/mock_context.dart';
import 'mock_services/mock_data_store.dart';
import 'mock_services/mock_auth.dart';
import 'validators/screen_validator.dart';

void main() {
  testWidgets('test sign in screen render no crash',
      (WidgetTester tester) async {
    AppAuth mockAuth = MockAppAuth();
    AppContext mockedAppContext = MockAppContext();
    DataBackend mockDataBackend = MockDataBackend();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone sign in screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(mockAuth, mockedAppContext, mockDataBackend),
    ));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsSignInScreenContent();
  });
}
