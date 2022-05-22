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
  currentTime.value = focusValue.value;
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
  storedValue = await storage.read(key: notification_key);
  storedValue == null
      ? isNotification.value = true
      : isNotification.value = storedValue == 'true';
  storedValue = await storage.read(key: always_on_top_key);
  storedValue == null
      ? isAlwaysOnTop.value = false
      : isAlwaysOnTop.value = storedValue == 'true';
  storedValue = await storage.read(key: auto_start_timer_key);
  storedValue == null
      ? isAutoStartTimer.value = false
      : isAutoStartTimer.value = storedValue == 'true';
  storedValue = await storage.read(key: auto_start_break_key);
  storedValue == null
      ? isAutoStartBreak.value = false
      : isAutoStartBreak.value = storedValue == 'true';
  storedValue = await storage.read(key: tick_sound_timer_key);
  storedValue == null
      ? isTickSoundTimer.value = false
      : isTickSoundTimer.value = storedValue == 'true';
  storedValue = await storage.read(key: tick_sound_break_key);
  storedValue == null
      ? isTickSoundBreak.value = false
      : isTickSoundBreak.value = storedValue == 'true';
  storedValue = await storage.read(key: minimize_to_tray_key);
  storedValue == null
      ? isMinimizeToTray.value = false
      : isMinimizeToTray.value = storedValue == 'true';
  storedValue = await storage.read(key: minimize_to_tray_on_close_key);
  storedValue == null
      ? isMinimizeToTrayOnClose.value = false
      : isMinimizeToTrayOnClose.value = storedValue == 'true';
}

Future<void> writeStorage() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  await storage.write(
    key: focus_key,
    value: getMinutes(focusValue.value),
  );
  await storage.write(
    key: short_break_key,
    value: getMinutes(shortBreakValue.value),
  );
  await storage.write(
    key: long_break_key,
    value: getMinutes(longBreakValue.value),
  );
  await storage.write(
    key: rounds_key,
    value: roundsValue.value.toString(),
  );
}

Future<void> writeKey(String key, var value) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  await storage.write(
    key: key,
    value: value.toString(),
  );
}

Future<void> deleteStorage() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  await storage.deleteAll();
}

Future<void> deleteKey(String key) async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  await storage.delete(key: key);
}