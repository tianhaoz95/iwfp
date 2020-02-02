import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/utilities/validators/card_info_validator.dart';
import 'package:iwfpapp/widgets/inputs/add_card_id_input.dart';
import 'package:iwfpapp/widgets/inputs/add_card_name_input.dart';

/// The screen that prompts user to input
/// information to initialize a credit card
///
/// {@category Screens}
class AddCardScreen extends StatefulWidget {
  final DataBackend dataBackend;
  const AddCardScreen(this.dataBackend, {Key key}) : super(key: key);

  @override
  _AddCardScreen createState() {
    return _AddCardScreen();
  }
}

class _AddCardScreen extends State<AddCardScreen> {
  final TextEditingController cardIdInputCtrl = TextEditingController();
  final TextEditingController cardNameInputCtrl = TextEditingController();
  SubmitScreenStatus status;
  DataBackend dataBackend;
  String msg = 'No message yet';

  @override
  void initState() {
    super.initState();
    status = SubmitScreenStatus.PENDING;
    if (widget.dataBackend == null) {
      status = SubmitScreenStatus.ERROR;
    } else {
      dataBackend = widget.dataBackend;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      DevNavConfig navConfig = ModalRoute.of(context).settings.arguments;
      status = navConfig.status;
    }
  }

  Future<void> promptWarning(
      BuildContext context, List<String> messages) async {
    List<Widget> content = messages.map((String message) {
      return Text(message);
    }).toList();
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: content,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> handleAddCard() async {
    String cardId = cardIdInputCtrl.text;
    String cardName = cardNameInputCtrl.text;
    ValidationResponse validationResponse = isValidCardInfo(cardName, cardId);
    if (!validationResponse.valid) {
      await promptWarning(context, validationResponse.messages);
      return;
    }
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    BackendResponse res = await dataBackend
        .initCreditCard(CreditCardInitRequest(CreditCard(cardName, cardId)));
    if (res == null) {
      setState(() {
        status = SubmitScreenStatus.ERROR;
        msg = 'Response is null, internal error';
      });
    }
    if (res.status == ResponseStatus.SUCCEESS) {
      setState(() {
        status = SubmitScreenStatus.DONE;
      });
    } else {
      setState(() {
        status = SubmitScreenStatus.ERROR;
        msg = res.msg;
      });
    }
  }

  Widget renderLoading(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text('Adding credit card to your wallet...'),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text('Please be patient...'),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text('This should take a few seconds...'),
          ),
        ],
      ),
    );
  }

  Widget renderError(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Error: ' + msg),
      ),
    );
  }

  Widget renderPending(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          AddCardIdInput(cardIdInputCtrl),
          SizedBox(height: 25.0),
          AddCardNameInput(cardNameInputCtrl),
          SizedBox(height: 25.0),
          RaisedButton(
            color: Colors.green,
            child: Text(
              'Add Card',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await handleAddCard();
            },
          ),
          RaisedButton(
            color: Colors.amber[900],
            child: Text('From Template', style: TextStyle(color: Colors.white)),
            key: Key('go_to_add_card_from_template_btn'),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/add_card_from_template');
            },
          ),
          RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/',
                  arguments: HomeTabId.CARD_MANAGEMENT);
            },
          ),
        ],
      ),
    );
  }

  Widget renderDone(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Text('Add card succeeded!'),
          ),
          SizedBox(
            height: 15.0,
          ),
          Material(
            child: RaisedButton(
              color: Colors.green,
              child: Text('Go to main menu',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/',
                    arguments: HomeTabId.CARD_MANAGEMENT);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget renderBodyContent(BuildContext context) {
    Widget content;
    switch (status) {
      case SubmitScreenStatus.PENDING:
        content = renderPending(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoading(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderError(context);
        break;
      case SubmitScreenStatus.DONE:
        content = renderDone(context);
        break;
      default:
        content = renderError(context);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          key: Key('add_card_title'),
        ),
      ),
      body: renderBodyContent(context),
    );
  }
}
