import 'package:flutter/material.dart';
import 'package:pomoflev/variables/styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: customBackgroundColor,
        child: const Center(
          child: Text('About'),
        ),
      ),
    );
  }
}
