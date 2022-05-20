import 'package:flutter/material.dart';
import 'package:pomoflev/variables/variables.dart';
import 'package:pomoflev/widgets/windows/settings_item.dart';
import 'package:window_manager/window_manager.dart';

class ScreenScreen extends StatelessWidget {
  const ScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'App Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Always On Top',
                isChecked: isAlwaysOnTop,
                onToggle: (v) async {
                  isAlwaysOnTop.value = !isAlwaysOnTop.value;
                  await windowManager.setAlwaysOnTop(isAlwaysOnTop.value);
                },
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Auto Start Timer',
                isChecked: isAutoStartTimer,
                onToggle: (v) {
                  isAutoStartTimer.value = !isAutoStartTimer.value;
                },
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Auto Start Break',
                isChecked: isAutoStartBreak,
                onToggle: (v) {
                  isAutoStartBreak.value = !isAutoStartBreak.value;
                },
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Tick Sound Timer',
                isChecked: isTickSoundTimer,
                onToggle: (v) {
                  isTickSoundTimer.value = !isTickSoundTimer.value;
                },
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Tick Sound Break',
                isChecked: isTickSoundBreak,
                onToggle: (v) {
                  isTickSoundBreak.value = !isTickSoundBreak.value;
                },
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Notification',
                isChecked: isNotification,
                onToggle: (v) {
                  isNotification.value = !isNotification.value;
                },
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Minimize to Tray',
                isChecked: isMinimizeToTray,
                onToggle: (v) {
                  isMinimizeToTray.value = !isMinimizeToTray.value;
                },
              ),
              const SizedBox(height: 15),
              SettingsItem(
                title: 'Minimize to Tray on Close',
                isChecked: isMinimizeToTrayOnClose,
                onToggle: (v) {
                  isMinimizeToTrayOnClose.value =
                      !isMinimizeToTrayOnClose.value;
                },
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'App Shortcuts',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Toggle Timer Window',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Reset Timer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Skip Timer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
