import 'dart:math';

import 'package:flutter/material.dart';

class PreferredWidthContent extends StatelessWidget {
  final Widget child;
  const PreferredWidthContent({this.child});
  @override
  Widget build(BuildContext context) {
    double contentWidth = min(MediaQuery.of(context).size.width, 600);
    return Container(
      child: Center(
        child: Container(
          width: contentWidth,
          child: this.child
        ),
      ),
    );
  }
}