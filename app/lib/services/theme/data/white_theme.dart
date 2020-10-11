import 'package:flutter/material.dart';

ThemeData whiteTheme = ThemeData(
  primaryColor: Colors.white,
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.green,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
      buttonColor: Colors.green,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      )),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.green),
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
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
  ),
);
