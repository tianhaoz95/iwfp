import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/login/main.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:mockito/mockito.dart';
import 'package:iwfpapp/services/mode.dart';
import 'mock_mode.dart';
import 'mock_data_store.dart';
import 'mock_auth.dart';

void main() {
  testWidgets('test contrib widget render no crash',
      (WidgetTester tester) async {
    IwfpappAuth mockAuth = MockIwfpappAuth();
    RunningMode mockMode = MockRunningMode();
    DataStore mockDataStore = MockDataStore();

    when(mockAuth.isSignedIn()).thenAnswer((_) => Future.value(false));

    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(mockAuth, mockMode, mockDataStore),
    ));
  });
}
