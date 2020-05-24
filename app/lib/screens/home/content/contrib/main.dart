import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/contrib/checkout_repository.dart';
import 'package:iwfpapp/screens/home/content/contrib/report_bug.dart';
import 'package:iwfpapp/screens/home/content/contrib/request_feature.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:url_launcher/url_launcher.dart';

/// This screen shows the ways users can contribute
/// to I want 5% project.
///
/// {@category Screens}
class Contrib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('contrib_screen_content'),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            ListViewItem(
                child: Text(
              'All contributions are appreciated!',
              style: TextStyle(fontSize: 18.0),
            )),
            SizedBox(height: 25.0),
            ListViewItem(
              child: Text(
                  '1. Contribute to repository (e.g. code, docs, issues, project management, etc)'),
            ),
            SizedBox(height: 25.0),
            ListViewItem(
              child: CheckoutGitHubRepository(),
            ),
            SizedBox(height: 25.0),
            ListViewItem(
              child: Text('2. Send me bug reports or user experiences'),
            ),
            SizedBox(height: 25.0),
            ListViewItem(
              child: ReportBug(),
            ),
            ListViewItem(
              child: RequestFeature(),
            ),
            ListViewItem(
              child: Container(
                child: RaisedButton(
                    child: Text('Other topics'),
                    onPressed: () async {
                      String url =
                          'https://github.com/tianhaoz95/iwfp/issues/new';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('launch ${url} failed');
                      }
                    }),
              ),
            ),
            SizedBox(height: 25.0),
            ListViewItem(
              child: Text('3. Sponsor the project'),
            ),
            SizedBox(height: 25.0),
            ListViewItem(
              child: Text('4. Coming soon...'),
            ),
          ],
        ));
  }
}
