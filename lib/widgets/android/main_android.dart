import 'package:flutter/material.dart';

class MainAndroid extends StatelessWidget {
  const MainAndroid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PomoFleV',
      home: Center(
        child: Text('Hello Android'),
      ),
    );
  }
}
