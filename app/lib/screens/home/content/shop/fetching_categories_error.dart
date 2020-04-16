import 'package:flutter/material.dart';

class FetchingCategoriesError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [Text('Error Fetching Categories')],
      ),
    );
  }
}
