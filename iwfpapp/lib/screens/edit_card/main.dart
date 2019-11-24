import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/status.dart';
import 'package:iwfpapp/widgets/promos/entry_view.dart';

class EditCardScreen extends StatefulWidget {
  @override
  _EditCardScreen createState() {
    return _EditCardScreen();
  }
}

class _EditCardScreen extends State<EditCardScreen> {
  CreditCard card = CreditCard('Unknown', 'unknown');
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;
  @override
  void initState() {
    super.initState();
    status = SubmitScreenStatus.PENDING;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      card = ModalRoute.of(context).settings.arguments;
    }
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(child: Text('unknown'));
  }

  List<Widget> renderPromotions(BuildContext context) {
    if (card.promos.isEmpty) {
      return [Text('empty')];
    } else {
      return card.promos.map((promo) => PromoEntry(promo, card)).toList();
    }
  }

  Widget renderPendingContent(BuildContext context) {
    List<Widget> promos = renderPromotions(context);
    List<Widget> contentList = [
      Material(
        color: Colors.cyan[100],
        child: Card(
          color: Colors.cyan,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text('Card Name: ' + card.name,
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text('Card ID: ' + card.id,
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    ];
    promos.forEach((Widget promo) {
      contentList.add(promo);
    });
    contentList.add(Container(
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: RaisedButton(
        color: Colors.green,
        child: Text('Add Promotion', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/add_promo', arguments: card);
        },
      ),
    ));
    contentList.add(Container(
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: RaisedButton(
        color: Colors.amber[900],
        child: Text('Cancel', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/main', arguments: card);
        },
      ),
    ));
    return Container(
      child: ListView(
        children: contentList,
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
      child: Text('error'),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: Text('done'),
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
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
        break;
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
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
        title: Text('Edit Card ' + card.name),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan[100],
      body: renderContent(context),
    );
  }
}
