import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

typedef Future<void> QueryChangeHandler(String query);
typedef Future<void> RefreshHandler();

class HomeTab {
  final String title;
  final IconData icon;
  final MaterialColor color;
  final Key btnKey;
  final Key titleKey;
  final HomeTabId id;
  QueryChangeHandler onQueryChange;
  RefreshHandler onRefresh;
  HomeTab(
    this.id,
    this.title,
    this.icon,
    this.color,
    this.btnKey,
    this.titleKey, {
    QueryChangeHandler onQueryChange,
    RefreshHandler onRefresh,
  }) {
    if (onQueryChange != null) {
      this.onQueryChange = onQueryChange;
    }
    if (onRefresh != null) {
      this.onRefresh = onRefresh;
    }
  }

  bool hasRefreshHandler() {
    if (this.onRefresh == null) {
      return false;
    } else {
      return true;
    }
  }

  bool hasQueryHandler() {
    if (this.onQueryChange == null) {
      return false;
    } else {
      return true;
    }
  }
}
