import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/data_store/base.dart';

class RemoveCardScreen extends StatefulWidget {
  final DataBackend dataBackend;
  const RemoveCardScreen(this.dataBackend, {Key key}) : super(key: key);
  @override
  _RemoveCardScreen createState() {
    return _RemoveCardScreen();
  }
}

class _RemoveCardScreen extends State<RemoveCardScreen> {
  CreditCard card = CreditCard('Unknown', 'unknown');
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      card = ModalRoute.of(context).settings.arguments;
    }
  }

  Future<void> handleRemoveCard() async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    BackendResponse reqStatus = await widget.dataBackend
        .removeCreditCard(CreditCardRemovalRequest(card.id));
    switch (reqStatus.status) {
      case ResponseStatus.SUCCEESS:
        setState(() {
          status = SubmitScreenStatus.DONE;
        });
        break;
      case ResponseStatus.FAILURE:
        setState(() {
          status = SubmitScreenStatus.ERROR;
        });
        break;
      default:
        setState(() {
          status = SubmitScreenStatus.UNKNOWN;
        });
    }
  }

  Widget renderContent(BuildContext context) {
    Widget content;
    switch (status) {
      case SubmitScreenStatus.PENDING:
        content = renderPendingContent(context);
        break;
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoadingContent(context);
        break;
      default:
        content = renderUnknownContent(context);
    }
    return content;
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: Center(
          child: Material(
        child: RaisedButton(
          color: Colors.green,
          child:
              Text('Done! Back to main', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/',
                arguments: HomeTabId.CARD_MANAGEMENT);
          },
        ),
      )),
    );
  }

  Widget renderErrorContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Error'),
      ),
    );
  }

  Widget renderLoadingContent(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(
        child: Center(
      child: Text('Unknown Error'),
    ));
  }

  Widget renderPendingContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Material(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('Removing Credit Card'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('${card.name} (${card.id})'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('Once removed, it cannot be recovered!'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
          Material(
              child: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.redAccent,
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: Text('Delete', style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                handleRemoveCard();
              },
            ),
          )),
          Material(
              child: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.green,
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: Text('Cancel', style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/',
                    arguments: HomeTabId.CARD_MANAGEMENT);
              },
            ),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Card'),
      ),
      body: renderContent(context),
    );
  }
}
