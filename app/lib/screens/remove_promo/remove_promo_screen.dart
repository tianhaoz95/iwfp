import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/remove_promo/remove_promo_content.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class RemovePromoScreen extends StatefulWidget {
  final RemovePromoMeta defaultRemovePromoMeta;

  /// This controls if the screen should navigate to
  /// home screen upon completion.
  /// The default is true as it is more convenient in
  /// app.
  /// It is false while testing UI, making it easier
  /// to debug.
  final bool autoNav;
  @override
  const RemovePromoScreen(
      {Key key, this.defaultRemovePromoMeta, this.autoNav = true})
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Promotion'),
      ),
      body: RemovePromoContent(
        removePromoMeta: this.removePromoMeta,
        autoNav: widget.autoNav,
      ),
    );
  }
}
