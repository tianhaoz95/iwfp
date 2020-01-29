import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/data_store/base.dart';

class RemovePromoScreen extends StatefulWidget {
  final DataBackend dataBackend;
  final RemovePromoMeta defaultRemovePromoMeta;
  @override
  const RemovePromoScreen(this.dataBackend,
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
    BackendResponse reqStatus = await widget.dataBackend.removePromotion(
        PromotionRemovalRequest(
            removePromoMeta.card.id, removePromoMeta.promo.id));
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
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('Deleting promotion'),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                            '${removePromoMeta.promo.name} (${removePromoMeta.promo.id})'),
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('from'),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                            '${removePromoMeta.card.name} (${removePromoMeta.card.id})'),
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Warning: It cannot be recovered',
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
            child: Card(
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
              color: Colors.green,
              onPressed: () {
                CreditCard modifiedCard = removePromoMeta.card;
                modifiedCard.removePromo(removePromoMeta.promo);
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
          ),
          body: renderContent(context),
        ));
  }
}
