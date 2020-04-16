import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card_from_template/add_card_from_template_content.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';
import 'package:provider/provider.dart';

/// This screen lists pre-defined credit card templates
/// for users to choose from.
///
/// {@category Screens}
class AddCardFromTemplateScreen extends StatefulWidget {
  const AddCardFromTemplateScreen({Key key}) : super(key: key);
  @override
  _AddCardFromTemplateScreen createState() {
    return _AddCardFromTemplateScreen();
  }
}

class _AddCardFromTemplateScreen extends State<AddCardFromTemplateScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<DataBackend>(context, listen: false)
        .maybeRefreshCreditCardTemplates();
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
            Navigator.pushReplacementNamed(context, '/add_card');
          },
        ),
      ),
      body: PreferredWidthContent(child: AddCardFromTemplateContent()),
    );
  }
}
