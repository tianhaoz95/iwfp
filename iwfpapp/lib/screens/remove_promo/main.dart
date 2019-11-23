import 'package:flutter/material.dart';
import 'package:iwfpapp/services/status.dart';

class RemovePromoScreen extends StatefulWidget {
  @override
  _RemovePromoScreen createState() {
    return _RemovePromoScreen();
  }
}

class _RemovePromoScreen extends State<RemovePromoScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;
  Widget renderPendingContent(BuildContext context) {
    return Container();
  }
  Widget renderLoadingContent(BuildContext context) {
    return Container();
  }
  Widget renderErrorContent(BuildContext context) {
    return Container();
  }
  Widget renderUnknownContent(BuildContext context) {
    return Container();
  }
  Widget renderDoneContent(BuildContext context) {
    return Container();
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
    return Scaffold(
      appBar: AppBar(title: Text('Remove Promotion'), backgroundColor: Colors.cyan,),
      body: renderContent(context),
      backgroundColor: Colors.cyan[100],
    );
  }
}