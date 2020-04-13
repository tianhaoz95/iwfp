import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/user/developer/develop_card.dart';
import 'package:iwfpapp/screens/home/content/user/developer/update_settings_btn.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:provider/provider.dart';

typedef void DeveloperSettingsUpdator(BuildContext context);

class DeveloperSection extends StatefulWidget {
  final DeveloperSettingsUpdator onDeveloperSettingsUpdate;
  const DeveloperSection(this.onDeveloperSettingsUpdate);
  @override
  _DeveloperSection createState() {
    return _DeveloperSection();
  }
}

class _DeveloperSection extends State<DeveloperSection> {
  bool nextIsDevFlagVal = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    nextIsDevFlagVal =
        Provider.of<AppContext>(context, listen: false).isDevMode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Text('Developer Settings'),
            ),
          ),
          Divider(),
          DevelopCard(
              Provider.of<AppContext>(context, listen: false).isDevMode(),
              (bool nextDevVal) {
            nextIsDevFlagVal = nextDevVal;
          }),
          UpdateSettingsButton(widget.onDeveloperSettingsUpdate),
          Divider(),
        ],
      ),
    );
  }
}
