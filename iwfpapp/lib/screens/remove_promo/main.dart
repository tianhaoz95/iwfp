import 'package:flutter/material.dart';
import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/status.dart';

class RemovePromoScreen extends StatefulWidget {
  final DataStore dataStore;
  final RemovePromoMeta defaultRemovePromoMeta;
  @override
  const RemovePromoScreen(this.dataStore,
      {Key key, this.defaultRemovePromoMeta})
      : super(key: key);
  @override
  _RemovePromoScreen createState() {
    return _RemovePromoScreen();
  }
}

class _RemovePromoScreen extends State<RemovePromoScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;
  RemovePromoMeta removePromoMeta;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      removePromoMeta = ModalRoute.of(context).settings.arguments;
    } else {
      if (widget.defaultRemovePromoMeta != null) {
        removePromoMeta = widget.defaultRemovePromoMeta;
      }
    }
  }

  Future<void> handleRemovePromo() async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    CloudFuncResponse reqStatus =
        await widget.dataStore.removePromo(removePromoMeta);
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
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Delete promotion ' +
                              removePromoMeta.promo.id +
                              ' from ' +
                              removePromoMeta.card.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'It cannot be recovered',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.redAccent,
              onPressed: () async {
                handleRemovePromo();
              },
              child: Text(
                'Remove Promotion',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.amber[900],
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
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

  Widget renderErrorContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Error :(',
          style: TextStyle(color: Colors.cyan),
        ),
      ),
    );
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Unknown Error :(',
          style: TextStyle(color: Colors.cyan),
        ),
      ),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Material(
            color: Colors.cyan[100],
            child: Card(
              color: Colors.cyan,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Promotion removed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              child: Text(
                'Back to editing card',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.amber[900],
              onPressed: () {
                CreditCard modifiedCard = removePromoMeta.card;
                modifiedCard.removePromo(removePromoMeta.promo);
                Navigator.maybePop(context);
                Navigator.pushReplacementNamed(context, '/edit_card',
                    arguments: modifiedCard);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget renderContent(BuildContext context) {
    Widget content = renderUnknownContent(context);
    switch (status) {
      case SubmitScreenStatus.PENDING:
        content = renderPendingContent(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoadingContent(context);
        break;
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
        break;
      default:
        content = renderUnknownContent(context);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Remove Promotion'),
            backgroundColor: Colors.cyan,
          ),
          body: renderContent(context),
          backgroundColor: Colors.cyan[100],
        ));
  }
}
