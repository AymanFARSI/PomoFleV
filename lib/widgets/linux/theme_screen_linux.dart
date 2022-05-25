import 'package:flutter/material.dart';
import 'package:pomoflev/widgets/common/theme_screen.dart';

class ThemeScreenLinux extends StatelessWidget {
  const ThemeScreenLinux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theming'),
        centerTitle: true,
      ),
      body: const ThemeScreen(),
    );
  }
}
