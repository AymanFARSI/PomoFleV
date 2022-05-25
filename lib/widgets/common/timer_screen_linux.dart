import 'package:flutter/material.dart';
import 'package:pomoflev/widgets/common/clock_screen.dart';

class TimerScreenLinux extends StatelessWidget {
  const TimerScreenLinux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TimerTitle(),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 32),
        child: ClockWidget(),
      ),
    );
  }
}
