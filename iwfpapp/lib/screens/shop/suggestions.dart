import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCategory {
  final String name;
  const ShopCategory(this.name);
}

class Suggestions extends StatelessWidget {
  final List<ShopCategory> suggestions;
  const Suggestions(this.suggestions);
  @override
  Widget build(BuildContext context) {
    List<Widget> suggestionWidgets = suggestions.map((ShopCategory suggestion) {
      return Column(
        children: <Widget>[
          SizedBox(height: 25.0),
          Material(
              elevation: 5.0,
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {},
                  child: Text(suggestion.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black45))))
        ],
      );
    }).toList();
    return Expanded(
        child: ListView(
            padding: const EdgeInsets.all(8.0), children: suggestionWidgets));
  }
}
