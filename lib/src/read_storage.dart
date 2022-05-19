import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomoflev/variables/storage_keys.dart';
import 'package:pomoflev/variables/variables.dart';

Future<void> readStorage() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? storedValue;
  storedValue = await storage.read(key: focus_key);
  storedValue == null
      ? focusValue.value = 25
      : focusValue.value = int.parse(storedValue);
  storedValue = await storage.read(key: short_break_key);
  storedValue == null
      ? shortBreakValue.value = 5
      : shortBreakValue.value = int.parse(storedValue);
  storedValue = await storage.read(key: long_break_key);
  storedValue == null
      ? longBreakValue.value = 15
      : longBreakValue.value = int.parse(storedValue);
  storedValue = await storage.read(key: rounds_key);
  storedValue == null
      ? roundsValue.value = 4
      : roundsValue.value = int.parse(storedValue);
}

Future<void> writeStorage() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  await storage.write(key: focus_key, value: focusValue.value.toString());
  await storage.write(key: short_break_key, value: shortBreakValue.value.toString());
  await storage.write(key: long_break_key, value: longBreakValue.value.toString());
  await storage.write(key: rounds_key, value: roundsValue.value.toString());
}