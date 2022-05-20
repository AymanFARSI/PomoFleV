import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' hide TextButton, IconButton;
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

Widget platformTextButton({
  required String text,
  required Function() onTap,
}) {
  // Windows
  if (Platform.isWindows) {
    return TextButton(
      onPressed: onTap,
      child: Text(text),
    );
  } else if (Platform.isLinux) {
    // Linux
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
    );
  } else {
    // Android by default
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}

Widget platformIconButton({
  required IconData icon,
  required Function() onTap,
}) {
  // Windows
  if (Platform.isWindows) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24,
        color: const Color.fromARGB(255, 32, 32, 32),
      ),
    );
  } else if (Platform.isLinux) {
    // Linux
    return ElevatedButton.icon(
      label: const Text(''),
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24,
        color: const Color.fromARGB(255, 32, 32, 32),
      ),
    );
  } else {
    // Android by default
    return ElevatedButton.icon(
      label: const Text(''),
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24,
        color: const Color.fromARGB(255, 32, 32, 32),
      ),
    );
  }
}
