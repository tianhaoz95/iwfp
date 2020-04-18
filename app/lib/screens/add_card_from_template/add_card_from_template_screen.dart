import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card_from_template/add_card_from_template_content.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:provider/provider.dart';

/// This screen lists pre-defined credit card templates
/// for users to choose from.
///
/// {@category Screens}
class AddCardFromTemplateScreen extends StatefulWidget {
  final bool autoNav;

  /// This controls if the back button should navigate to
  /// home screen or simply pop.
  /// The default is false meaning the back button will
  /// navigate to the home screen.
  /// In UI development, it is pop since it will lead to
  /// potential crash in mocked app otherwise.
  final bool popNav;

  /// This controls if the screen should refresh its back
  /// end data upon initialzation.
  /// It is defaulted to true since the app wants to prevent
  /// corrupted data.
  /// However, in UI development, it should be false since
  /// it is hard to debug the error recovery otherwise.
  final bool autoRefresh;
  const AddCardFromTemplateScreen(
      {Key key,
      this.autoNav = true,
      this.popNav = false,
      this.autoRefresh = true})
      : super(key: key);
  @override
  _AddCardFromTemplateScreen createState() {
    return _AddCardFromTemplateScreen();
  }
}

class _AddCardFromTemplateScreen extends State<AddCardFromTemplateScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.autoRefresh) {
      Provider.of<DataBackend>(context, listen: false)
          .maybeRefreshCreditCardTemplates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card from Templates',
          key: Key('add_card_from_template_title'),
        ),
        leading: FlatButton(
          key: Key('template_back_btn'),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            if (widget.popNav) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/add_card');
            }
          },
        ),
      ),
      body: AddCardFromTemplateContent(
        autoNav: widget.autoNav,
      ),
    );
  }
}
