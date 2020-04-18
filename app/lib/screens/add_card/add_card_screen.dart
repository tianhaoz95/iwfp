import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/add_card/content.dart';

/// The screen that prompts user to input
/// information to initialize a credit card
///
/// {@category Screens}
class AddCardScreen extends StatelessWidget {
  final bool autoNav;

  const AddCardScreen({Key key, this.autoNav = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          key: Key('add_card_title'),
        ),
      ),
      body: AddCardScreenContent(
        autoNav: this.autoNav,
      ),
    );
  }
}
