import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomoflev/helpers/time_helpers.dart';
import 'package:pomoflev/variables/storage_keys.dart';
import 'package:pomoflev/variables/variables.dart';

Future<void> readStorage() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? storedValue;
  storedValue = await storage.read(key: focus_key);
  storedValue == null
      ? focusValue.value = getDateTime(minutes: '25')
      : focusValue.value = getDateTime(minutes: storedValue);
  storedValue = await storage.read(key: short_break_key);
  storedValue == null
      ? shortBreakValue.value = getDateTime(minutes: '05')
      : shortBreakValue.value = getDateTime(minutes: storedValue);
  storedValue = await storage.read(key: long_break_key);
  storedValue == null
      ? longBreakValue.value = getDateTime(minutes: '15')
      : longBreakValue.value = getDateTime(minutes: storedValue);
  storedValue = await storage.read(key: rounds_key);
  storedValue == null
      ? roundsValue.value = 4
      : roundsValue.value = int.parse(storedValue);
}

Future<void> writeStorage() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  await storage.write(key: focus_key, value: getMinutes(focusValue.value));
  await storage.write(key: short_break_key, value: getMinutes(shortBreakValue.value));
  await storage.write(key: long_break_key, value: getMinutes(longBreakValue.value));
  await storage.write(key: rounds_key, value: roundsValue.value.toString());
}