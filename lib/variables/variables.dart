import 'package:get/get.dart';
import 'package:pomoflev/src/pomodoro.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:pomoflev/helpers/time_helpers.dart';

// Pomodoro variables
Rx<DateTime> focusValue = Rx<DateTime>(getDateTime(minutes: '25'));
Rx<DateTime> shortBreakValue = Rx<DateTime>(getDateTime(minutes: '05'));
Rx<DateTime> longBreakValue = Rx<DateTime>(getDateTime(minutes: '15'));
RxInt roundsValue = RxInt(4);

// State variables
RxBool isContinue = RxBool(false);
RxBool isBreak = RxBool(false);
RxInt currentRound = RxInt(1);
RxBool isMuted = RxBool(false);
Rx<DateTime> currentTime = Rx<DateTime>(
  DateTime.parse('2020-01-01T00:25:00'),
);

// Windows variables
RxBool isAlwaysOnTop = RxBool(false);
RxBool isAutoStartTimer = RxBool(false);
RxBool isAutoStartBreak = RxBool(false);
RxBool isTickSoundTimer = RxBool(true);
RxBool isTickSoundBreak = RxBool(true);
RxBool isNotification = RxBool(true);
RxBool isMinimizeToTray = RxBool(true);
RxBool isMinimizeToTrayOnClose = RxBool(true);

// Notification sounds
String notifSoundPath = 'notif_sounds/notification_sound.mp3';

// Pomodoro functions
PomodoroHandler pomodoroHandler = PomodoroHandler();

// System Tray Menu Items
List<MenuItem> items = [
  MenuItem(
    label: 'Show window',
    onClick: (item) async {
      await windowManager.show();
    },
  ),
  MenuItem(
    label: 'Hide window',
    onClick: (item) async {
      await windowManager.hide();
    },
  ),
  MenuItem.separator(),
  MenuItem.submenu(
    label: 'Tray menu',
    submenu: Menu(
      items: [
        MenuItem(
          label: 'Disabled system tray',
          onClick: (item) async {
            if (await windowManager.isVisible()) {
              await trayManager.destroy();
              isMinimizeToTray.value = false;
              isMinimizeToTrayOnClose.value = false;
            } else {
              await trayManager.setContextMenu(
                Menu(
                  items: [
                    ...items,
                    MenuItem.separator(),
                    MenuItem(
                      label:
                          'You should show show PomoFleV before disabling the system tray',
                      onClick: (item) async {
                        await windowManager.show();
                        await trayManager.destroy();
                      },
                    ),
                  ],
                ),
              );
              await trayManager.popUpContextMenu();
            }
          },
        ),
      ],
    ),
  ),
  MenuItem.separator(),
  MenuItem(
    label: 'Exit',
    onClick: (item) async {
      await trayManager.destroy();
      await windowManager.destroy();
    },
  ),
];
