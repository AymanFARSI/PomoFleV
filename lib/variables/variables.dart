import 'package:get/get.dart';
import 'package:system_tray/system_tray.dart';
import 'package:pomoflev/src/pomodoro.dart';
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
SystemTray systemTray = SystemTray();

// Notification sounds
String notifSoundPath = 'notif_sounds/notification_sound.mp3';

// Pomodoro functions
PomodoroHandler pomodoroHandler = PomodoroHandler();
