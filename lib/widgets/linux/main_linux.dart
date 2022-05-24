import 'package:flutter/material.dart';
import 'package:pomoflev/widgets/linux/linux_wrapper.dart';
import 'package:yaru/yaru.dart';

class MainLinux extends StatelessWidget {
  const MainLinux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      title: 'PomoFleV',
      home: const YaruTheme(
        data: YaruThemeData(
          variant: YaruVariant.red,
          themeMode: ThemeMode.system,
        ),
        child: LinuxWrapper(),
      ),
    );
  }
}
