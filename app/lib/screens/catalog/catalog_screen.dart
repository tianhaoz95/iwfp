import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/catalog/catalog_content.dart';
import 'package:iwfpapp/services/config/typedefs/catalog_categories.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class CatalogScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogScreen();
  }
}

class _CatalogScreen extends State<CatalogScreen> {
  CatalogCategory category;

  @override
  void initState() {
    super.initState();
    category = CatalogCategory.SIGN_IN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Catalog'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 25.0,
            ),
            ListViewItem(
              child: Image(
                image: AssetImage(
                    'assets/auth_screen_subtitle_high_resolution.png'),
              ),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.ADD_CARD;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Add Card')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.ADD_FROM_TEMPLATE;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Add From Template')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.ADD_PROMOTION;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Add Promotion')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.EDIT_CARD;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Edit Card')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.HOME;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Home')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.PLACEHOLDER;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Placeholder')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.RECOMMENDATIONS;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Recommendations')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.REMOVE_CARD;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Remove Card')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.REMOVE_PROMOTION;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Remove Promotion')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.SIGN_IN;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Sign In')),
            ),
            ListViewItem(
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      category = CatalogCategory.SIGN_UP;
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Sign Up')),
            ),
          ],
        ),
      ),
      body: CatalogContent(category: this.category),
    );
  }
}
