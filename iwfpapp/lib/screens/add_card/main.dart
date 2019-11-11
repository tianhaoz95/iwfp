import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/widgets/inputs/add_card_id_input.dart';
import 'package:iwfpapp/widgets/inputs/add_card_name_input.dart';
import 'package:iwfpapp/widgets/buttons/submit_add_card_btn.dart';
import 'package:iwfpapp/services/status.dart';
import 'package:iwfpapp/services/credit_card.dart';

class AddCardScreen extends StatefulWidget {
  final DataStore dataStore;
  const AddCardScreen(this.dataStore, {Key key}) : super(key: key);

  @override
  _AddCardScreen createState() {
    return _AddCardScreen();
  }
}

class _AddCardScreen extends State<AddCardScreen> {
  final TextEditingController cardIdInputCtrl = TextEditingController();
  final TextEditingController cardNameInputCtrl = TextEditingController();
  SubmitScreenStatus status;
  DataStore dataStore;
  String msg = 'No message yet';

  @override
  void initState() {
    super.initState();
    status = SubmitScreenStatus.PENDING;
    if (widget.dataStore == null) {
      status = SubmitScreenStatus.ERROR;
    } else {
      dataStore = widget.dataStore;
    }
  }

  Future<void> handleAddCard() async {
    String cardId = cardIdInputCtrl.text;
    String cardName = cardNameInputCtrl.text;
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    CloudFuncResponse res = await dataStore.addCard(CreditCard(cardName, cardId));
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
      child: Center(
        child: CircularProgressIndicator(),
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
          SubmitAddCardButton(
            onPressedCallback: () async {
              await handleAddCard();
            },
          ),
        ],
      ),
    );
  }

  Widget renderDone(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            Text('Add card succeeded'),
            Text('Go home')
          ],
        ),
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
        backgroundColor: Colors.cyan,
        title: Text('Add card'),
      ),
      backgroundColor: Colors.cyan[100],
      body: renderBodyContent(context),
    );
  }
}
