import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/add_card/content.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

/// The screen that prompts user to input
/// information to initialize a credit card
///
/// {@category Screens}
class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          key: Key('add_card_title'),
        ),
      ),
      body: PreferredWidthContent(child: AddCardScreenContent()),
    );
  }
}
