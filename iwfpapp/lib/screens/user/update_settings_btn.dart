import 'package:flutter/material.dart';

typedef updateSettingsFuncType = void Function(BuildContext);

class UpdateSettingsButton extends StatelessWidget {
  final updateSettingsFuncType handleUpdateSettings;
  const UpdateSettingsButton(this.handleUpdateSettings);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: Material(
        color: Colors.orange[100],
        child: RaisedButton(
          color: Colors.orange,
          child: Text('Update Settings', style: TextStyle(color: Colors.white)),
          onPressed: () {
            handleUpdateSettings(context);
          },
        ),
      ),
    );
  }
}
