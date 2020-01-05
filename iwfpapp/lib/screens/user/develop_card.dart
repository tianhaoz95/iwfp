import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/user/develop_mode_toggle.dart';
import 'package:iwfpapp/screens/user/data_store_mode_selection.dart';

class DevelopCard extends StatelessWidget {
  final setIsDevValFuncType setIsDevCallbackFunc;
  final bool initIsDevVal;
  const DevelopCard(this.initIsDevVal, this.setIsDevCallbackFunc);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Card(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Text('Developer Settings'),
              DevelopmentModeToggle(initIsDevVal, setIsDevCallbackFunc),
              DataStoreModeSelection(),
            ],
          ),
        ),
      ),
    );
  }
}
