import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/data_store/base.dart';
import 'package:iwfpapp/services/utilities/card_template.dart';
import 'package:iwfpapp/widgets/credit_cards/template.dart';

class AddCardFromTemplateScreen extends StatefulWidget {
  final DataBackend dataBackend;
  const AddCardFromTemplateScreen(this.dataBackend, {Key key})
      : super(key: key);
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
    BackendResponse response = await widget.dataBackend
        .initCreditCardWithTemplate(CreditCardAdditionRequest(template));
    if (response.status == ResponseStatus.SUCCEESS) {
      setState(() {
        status = SubmitScreenStatus.DONE;
      });
    } else if (response.status == ResponseStatus.FAILURE) {
      setState(() {
        status = SubmitScreenStatus.ERROR;
      });
    } else {
      setState(() {
        status = SubmitScreenStatus.UNKNOWN;
      });
    }
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(
      child: Text('Unknown error'),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Material(
            child: Card(
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: Text('Card added from template'),
                key: Key('add_card_template_success_confirmation'),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/',
                      arguments: HomeTabId.CARD_MANAGEMENT);
                },
                key: Key('add_template_success_nav_btn'),
                color: Colors.green,
                child: Text(
                  'Back',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  Widget renderPendingContent(BuildContext context) {
    return Container(
      child: ListView(
        children: cardTemplateList.map((CreditCard cardTemplate) {
          return TemplateCreditCard(
            card: cardTemplate,
            color: Colors.cyan,
            onPressedAddTemplate: () {
              handleAddTemplate(cardTemplate);
            },
          );
        }).toList(),
      ),
    );
  }

  Widget renderErrorContent(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        SizedBox(
          height: 5.0,
        ),
        Material(
          color: Colors.cyan[100],
          child: Card(
            color: Colors.cyan,
            child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: Text('Error using template',
                    style: TextStyle(color: Colors.white))),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: RaisedButton(
            color: Colors.redAccent,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text('Back', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    ));
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
      body: renderContent(context),
    );
  }
}
