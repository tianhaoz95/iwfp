import 'package:flutter/material.dart';

class RemovePromoError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Error :(',
          style: TextStyle(color: Colors.cyan),
        ),
      ),
    );
  }
  
}