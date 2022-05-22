import 'dart:async';
import 'package:pomoflev/helpers/inapp_notif.dart';
import 'package:pomoflev/helpers/time_helpers.dart';
import 'package:pomoflev/variables/variables.dart';

class PomodoroHandler {
  late Timer pomoTimer;

  PomodoroHandler() {
    pomoTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (computeSeconds(currentTime.value) == 0) {
        isContinue.value = false;
        pomodoroHandler.nextRound();
      }
      if (isContinue.value) {
        currentTime.value = currentTime.value.subtract(
          const Duration(seconds: 60),
        );
      }
    });
  }

  void dropTimer() {
    pomoTimer.cancel();
  }

  void startTimer() {
    pomoTimer;
    isContinue.value = true;
  }

  void pauseTimer() {
    isContinue.value = false;
  }

  void resetTimer() {
    currentTime.value = DateTime.parse('2020-01-01T00:25:00');
    currentRound.value = 1;
  }

  void nextRound({bool justSkip = false}) {
    if (justSkip) {
      if (currentRound.value == roundsValue.value) {
        currentRound.value = 1;
      } else {
        currentRound.value++;
      }
      currentTime.value = DateTime.parse('2020-01-01T00:25:00');
      return;
    }
    if (isNotification.value) {
      String tempBody;
      if (currentRound.value != roundsValue.value && !isBreak.value) {
        tempBody = 'Take a short break!';
      } else if (currentRound.value == roundsValue.value && !isBreak.value) {
        tempBody = 'Take a long break!';
      } else {
        tempBody = 'Time to work!';
      }
      pushInAppNotification(
        title: 'Time is up!',
        body: tempBody,
      );
    }
    if (currentRound.value == roundsValue.value) {
      isBreak.value = true;
      currentTime.value = longBreakValue.value;
      currentRound.value = 1;
    } else if (isBreak.value) {
      isBreak.value = false;
      currentTime.value = focusValue.value;
    } else {
      isBreak.value = true;
      currentTime.value = shortBreakValue.value;
      currentRound.value++;
    }
    if (isAutoStartTimer.value && !isBreak.value) {
      pomodoroHandler.startTimer();
    } else if (isAutoStartBreak.value && isBreak.value) {
      pomodoroHandler.startShortBreak();
    } else {
      pomodoroHandler.pauseTimer();
    }
  }

  void resetRounds() {
    roundsValue.value = 4;
  }

  void muteTimer() {
    isMuted.value = true;
  }

  void unmuteTimer() {
    isMuted.value = false;
  }

  void startShortBreak() {
    currentTime.value = shortBreakValue.value;
    isContinue.value = true;
  }

  void startLongBreak() {
    currentTime.value = longBreakValue.value;
    isContinue.value = true;
  }
}
