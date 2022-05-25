import 'package:flutter/material.dart';
import 'package:adwaita/adwaita.dart';
import 'package:pomoflev/widgets/linux/linux_wrapper.dart';

class MainLinux extends StatelessWidget {
  const MainLinux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AdwaitaThemeData.dark(),
      theme: AdwaitaThemeData.light(),
      title: 'PomoFleV',
      themeMode: ThemeMode.system,
      home: const LinuxWrapper(),
    );
  }
}
