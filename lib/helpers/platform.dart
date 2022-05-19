import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:pomoflev/widgets/android/main_android.dart';
import 'package:pomoflev/widgets/linux/main_linux.dart';
import 'package:pomoflev/widgets/windows/main_windows.dart';

Widget platformApp() {
  // Windows
  if (Platform.isWindows) {
    return const MainWindows();
  } else if (Platform.isLinux) {
    // Linux
    return const MainLinux();
  } else {
    // Android by default
    return const MainAndroid();
  }
}
