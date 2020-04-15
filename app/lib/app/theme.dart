import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primaryColor: Colors.black,
  accentColor: Colors.black,
  appBarTheme: AppBarTheme(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  cardTheme: CardTheme(
    color: Colors.white,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.black45,
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.black45),
    shape: StadiumBorder(),
    secondaryLabelStyle: TextStyle(color: Colors.black45),
    brightness: Brightness.dark,
    secondarySelectedColor: Colors.black45,
    labelPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
    padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
    selectedColor: Colors.black45,
  ),
);
