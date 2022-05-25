// ignore_for_file: library_prefixes

import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart' as FluentUI hide Colors;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflev/helpers/time_helpers.dart';
import 'package:pomoflev/src/storage.dart';
import 'package:pomoflev/variables/storage_keys.dart';
import 'package:pomoflev/variables/variables.dart';
import 'package:pomoflev/widgets/android/main_android.dart';
import 'package:pomoflev/widgets/linux/main_linux.dart';
import 'package:pomoflev/widgets/linux/settings_item_linux.dart';
import 'package:pomoflev/widgets/windows/main_windows.dart';
import 'package:pomoflev/widgets/windows/settings_item_windows.dart';

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
    return FluentUI.TextButton(
      onPressed: onTap,
      child: Text(text),
    );
  } else if (Platform.isLinux) {
    // Linux
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
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
    return FluentUI.IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24,
        color: const Color.fromARGB(255, 32, 32, 32),
      ),
    );
  } else if (Platform.isLinux) {
    // Linux
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24,
        color: const Color.fromARGB(255, 32, 32, 32),
      ),
    );
  } else {
    // Android by default
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24,
        color: const Color.fromARGB(255, 32, 32, 32),
      ),
    );
  }
}

Widget platformToggleSwitch({
  required String title,
  required RxBool isChecked,
  required Function(bool) onToggle,
}) {
  // Windows
  if (Platform.isWindows) {
    return SettingsItemWindows(
      title: title,
      isChecked: isChecked,
      onToggle: onToggle,
    );
  } else if (Platform.isLinux) {
    // Linux
    return SettingsItemLinux(
      title: title,
      isChecked: isChecked,
      onToggle: onToggle,
    );
  } else {
    // Android by default
    return Text(title);
  }
}

Widget platformResetButton() {
  if (Platform.isWindows) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 15,
      ),
      child: FluentUI.Button(
        onPressed: () async {
          await writeKey(focus_key, '25');
          await writeKey(short_break_key, '05');
          await writeKey(long_break_key, '15');
          await writeKey(rounds_key, '4');
          focusValue.value = getDateTime(minutes: '25');
          shortBreakValue.value = getDateTime(minutes: '05');
          longBreakValue.value = getDateTime(minutes: '15');
          roundsValue.value = 4;
        },
        style: FluentUI.ButtonStyle(
          backgroundColor: FluentUI.ButtonState.all(Colors.white),
          foregroundColor: FluentUI.ButtonState.all(Colors.black),
          border: FluentUI.ButtonState.all(
            const BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          elevation: FluentUI.ButtonState.all(3),
          shape: FluentUI.ButtonState.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          textStyle: FluentUI.ButtonState.all(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          shadowColor: FluentUI.ButtonState.all(Colors.black),
          padding: FluentUI.ButtonState.all(
            const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 7,
            ),
          ),
        ),
        child: const Text(
          'Reset Config',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  } else if (Platform.isLinux) {
    // Linux
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 15,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () async {
          await writeKey(focus_key, '25');
          await writeKey(short_break_key, '05');
          await writeKey(long_break_key, '15');
          await writeKey(rounds_key, '4');
          focusValue.value = getDateTime(minutes: '25');
          shortBreakValue.value = getDateTime(minutes: '05');
          longBreakValue.value = getDateTime(minutes: '15');
          roundsValue.value = 4;
        },
        child: const Text(
          'Reset Config',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  } else {
    // Android by default
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 15,
      ),
      child: ElevatedButton(
        onPressed: () async {
          await writeKey(focus_key, '25');
          await writeKey(short_break_key, '05');
          await writeKey(long_break_key, '15');
          await writeKey(rounds_key, '4');
          focusValue.value = getDateTime(minutes: '25');
          shortBreakValue.value = getDateTime(minutes: '05');
          longBreakValue.value = getDateTime(minutes: '15');
          roundsValue.value = 4;
        },
        child: const Text(
          'Reset Config',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
