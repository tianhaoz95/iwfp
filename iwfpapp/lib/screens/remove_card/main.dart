import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/status.dart';

class RemoveCardScreen extends StatefulWidget {
  final DataStore dataStore;
  const RemoveCardScreen(this.dataStore, {Key key}) : super(key: key);
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
    CloudFuncResponse reqStatus = await widget.dataStore.removeCard(card);
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
        color: Colors.cyan[100],
        child: RaisedButton(
          color: Colors.cyan,
          child:
              Text('Done! Back to main', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main');
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
            color: Colors.cyan[100],
            child: Card(
              color: Colors.cyan,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('Remove Credit Card',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('Card Name: ' + card.name,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('Card ID: ' + card.id,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
              color: Colors.cyan[100],
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: RaisedButton(
                  color: Colors.red,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child:
                        Text('Delete', style: TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    handleRemoveCard();
                  },
                ),
              )),
          Material(
              color: Colors.cyan[100],
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: RaisedButton(
                  color: Colors.cyan,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {},
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
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan[100],
      body: renderContent(context),
    );
  }
}
