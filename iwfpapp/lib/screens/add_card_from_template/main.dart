import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/status.dart';
import 'package:iwfpapp/services/utilities/card_template.dart';
import 'package:iwfpapp/widgets/credit_cards/template.dart';

class AddCardFromTemplateScreen extends StatefulWidget {
  const AddCardFromTemplateScreen({Key key}) : super(key: key);
  @override
  _AddCardFromTemplateScreen createState() {
    return _AddCardFromTemplateScreen();
  }
}

class _AddCardFromTemplateScreen extends State<AddCardFromTemplateScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;
  List<CreditCard> cardTemplateList = [];

  @override
  void initState() {
    super.initState();
    populateCardTemplateList();
  }

  Future<void> populateCardTemplateList() async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    cardTemplateList = await getCreditCardTemplates();
    setState(() {
      status = SubmitScreenStatus.PENDING;
    });
  }

  Future<void> handleAddTemplate(CreditCard template) async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(
      child: Text('Unknown error'),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: Text('done'),
    );
  }

  Widget renderPendingContent(BuildContext context) {
    return Container(
      child: ListView(
        children: cardTemplateList.map((CreditCard cardTemplate) {
          return TemplateCreditCard(card: cardTemplate, color: Colors.cyan, onPressedAddTemplate: () {
            handleAddTemplate(cardTemplate);
          },);
        }).toList(),
      ),
    );
  }

  Widget renderErrorContent(BuildContext context) {
    return Container(
      child: Text('Error'),
    );
  }

  Widget renderLoadingContent(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget renderContent(BuildContext context) {
    Widget content = renderUnknownContent(context);
    switch (status) {
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
        break;
      case SubmitScreenStatus.PENDING:
        content = renderPendingContent(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoadingContent(context);
        break;
      default:
        content = renderUnknownContent(context);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text('Add Card from Templates'),
        backgroundColor: Colors.cyan,
      ),
      body: renderContent(context),
    );
  }
}