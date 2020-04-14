import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/remove_promo/remove_promo_content.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class RemovePromoScreen extends StatefulWidget {
  final RemovePromoMeta defaultRemovePromoMeta;
  @override
  const RemovePromoScreen({Key key, this.defaultRemovePromoMeta})
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Remove Promotion'),
          ),
          body: PreferredWidthContent(
              child: RemovePromoContent(
            removePromoMeta: this.removePromoMeta,
          )),
        ));
  }
}
