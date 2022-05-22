import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:pomoflev/variables/styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AboutPage aboutPage = AboutPage(
      scaffoldBuilder: (context, title, child) {
        return Scaffold(
          body: child,
        );
      },
      values: {
        'version': '0.2.1',
        'year': DateTime.now().year.toString(),
        'author': 'FARSI Ayman',
      },
      applicationVersion: 'Version {{ version }}',
      applicationDescription: const Text(
        'PomoFlev - Pomodoro App made with 💖 by FARSI Ayman using Flutter',
        textAlign: TextAlign.justify,
      ),
      applicationIcon: Image.asset(
        'assets/logos/pomoflev_logo.png',
        height: 100,
      ),
      applicationLegalese: 'Copyright © {{ author }}, {{ year }}',
      children: const <Widget>[
        // MarkdownPageListTile(
        //   filename: 'README.md',
        //   title: Text('View Readme'),
        //   icon: Icon(Icons.all_inclusive),
        // ),
        // MarkdownPageListTile(
        //   filename: 'CHANGELOG.md',
        //   title: Text('View Changelog'),
        //   icon: Icon(Icons.view_list),
        // ),
        // MarkdownPageListTile(
        //   filename: 'LICENSE.md',
        //   title: Text('View License'),
        //   icon: Icon(Icons.description),
        // ),
        // MarkdownPageListTile(
        //   filename: 'CONTRIBUTING.md',
        //   title: Text('Contributing'),
        //   icon: Icon(Icons.share),
        // ),
        // MarkdownPageListTile(
        //   filename: 'CODE_OF_CONDUCT.md',
        //   title: Text('Code of conduct'),
        //   icon: Icon(Icons.sentiment_satisfied),
        // ),
        LicensesPageListTile(
          title: Text('Open source Licenses'),
          icon: Icon(Icons.favorite),
        ),
      ],
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: customBackgroundColor,
        child: aboutPage,
      ),
    );
  }
}
