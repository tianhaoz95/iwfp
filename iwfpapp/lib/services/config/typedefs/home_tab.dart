import 'package:flutter/material.dart';

typedef Future<void> QueryChangeHandler(String query);
typedef Future<void> RefreshHandler();

class HomeTab {
  final String title;
  final IconData icon;
  final MaterialColor color;
  final Key btnKey;
  final Key titleKey;
  QueryChangeHandler onQueryChange; 
  RefreshHandler onRefresh;
  HomeTab(this.title, this.icon, this.color, this.btnKey, this.titleKey, {
    QueryChangeHandler onQueryChange,
    RefreshHandler onRefresh,
  }) {
    if (onQueryChange != null) {
      this.onQueryChange = onQueryChange;
    } else {
      this.onQueryChange = (String query) async {};
    }
    if (onRefresh != null) {
      this.onRefresh = onRefresh;
    } else {
      this.onRefresh = () async {};
    }
  }
}
