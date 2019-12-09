import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/sign_up/main.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:mockito/mockito.dart';
import 'mock_services/mock_auth.dart';

void main() {
  testWidgets('test sign in screen render no crash',
      (WidgetTester tester) async {
    IwfpappAuth mockAuth = MockIwfpappAuth();
    when(mockAuth.isSignedIn()).thenAnswer((_) => Future.value(false));
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone sign in screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(mockAuth),
    ));
  });
}
