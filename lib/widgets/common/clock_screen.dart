import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pomoflev/helpers/inapp_notif.dart';
import 'package:pomoflev/helpers/time_helpers.dart';
import 'package:pomoflev/helpers/platform.dart';
import 'package:pomoflev/variables/variables.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  void initState() {
    super.initState();
    if (isAutoStartTimer.value) {
      pomodoroHandler.startTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Obx(
            () => Stack(
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.5,
                    value: computeCircleProgress(),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.purple,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Center(
                    child: Text(
                      currentTime.value.toIso8601String().substring(
                            14,
                            currentTime.value.toIso8601String().length - 4,
                          ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            if (isContinue.value) {
              pomodoroHandler.pauseTimer();
            } else {
              pomodoroHandler.startTimer();
            }
          },
          onLongPress: () {
            pushInAppNotification(
              title: 'Reset Timer',
              body: 'Timer has been reset',
            );
            pomodoroHandler.resetTimer();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            child: Obx(
              () => Icon(
                !isContinue.value ? Icons.pause : Icons.play_arrow_rounded,
                color: Colors.black87,
                size: 32,
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      '${currentRound.value}/${roundsValue.value}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  platformTextButton(
                    text: 'RESET',
                    onTap: () {
                      pomodoroHandler.resetRounds();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  platformIconButton(
                    icon: Icons.skip_next,
                    onTap: () {
                      pomodoroHandler.nextRound(justSkip: true);
                    },
                  ),
                  Obx(
                    () => platformIconButton(
                      icon: isMuted.value
                          ? Icons.volume_off_rounded
                          : Icons.volume_up_rounded,
                      onTap: () {
                        isMuted.value = !isMuted.value;
                        isTickSoundTimer.value = !isTickSoundTimer.value;
                        isTickSoundBreak.value = !isTickSoundBreak.value;
                        isNotification.value = !isNotification.value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimerTitle extends StatelessWidget {
  const TimerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Timer: ${isBreak.value ? 'Break' : 'Focus'}',
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
