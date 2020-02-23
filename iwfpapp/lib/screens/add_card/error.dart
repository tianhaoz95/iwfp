import 'package:flutter/material.dart';

class AddCardScreenErrorContent extends StatelessWidget {
  final String errMsg;
  const AddCardScreenErrorContent({@required this.errMsg});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Error: ' + this.errMsg),
      ),
    );
  }
}
