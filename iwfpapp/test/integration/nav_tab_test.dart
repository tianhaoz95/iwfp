import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/mode.dart';
import 'package:iwfpapp/screens/home/main.dart';
import 'package:mockito/mockito.dart';
import 'mock_auth.dart';
import 'mock_mode.dart';
import 'mock_data_store.dart';

void main() {
  testWidgets('test app render no crash', (WidgetTester tester) async {
    RunningMode mockMode = MockRunningMode();
    IwfpappAuth mockAuth = MockIwfpappAuth();
    DataStore mockDataStore = MockDataStore();
    when(mockAuth.isSignedIn()).thenAnswer((_) => Future.value(true));
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(mockMode, mockDataStore, mockAuth),
    ));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
  });
}
