import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/sign_up/main.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'mock_services/mock_auth.dart';
import 'validators/obscure_input_validator.dart';

void main() {
  testWidgets('test sign up screen details', (WidgetTester tester) async {
    AppAuth mockAuth = MockAppAuth();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone sign up screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(mockAuth),
    ));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    await textInputIsObscure(tester, Key('sign_up_pwd_input'));
    await textInputIsObscure(tester, Key('sign_up_pwd_confirmation_input'));
  });
}
