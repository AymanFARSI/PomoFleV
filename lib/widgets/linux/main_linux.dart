import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class MainLinux extends StatelessWidget {
  const MainLinux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PomoFleV',
      home: YaruTheme(
        child: Center(
          child: Text('Hello Linux'),
        ),
      ),
    );
  }
}
