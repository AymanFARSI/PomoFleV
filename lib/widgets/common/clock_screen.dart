import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pomoflev/helpers/inapp_notif.dart';
import 'package:pomoflev/helpers/play_sound.dart';
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
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (computeSeconds(currentTime.value) == 0) {
        isContinue.value = false;
        // TODO: send notification
      }
      if (isContinue.value) {
        currentTime.value = currentTime.value.subtract(
          const Duration(seconds: 1),
        );
      }
    });
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
                    value: computeSeconds(currentTime.value) /
                        computeSeconds(
                          DateTime.parse('2020-01-01T00:25:00'),
                        ),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.purple),
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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            platformTextButton(
              text: 'RESET',
              onTap: () async {
                await playSound(notifSoundPath);
                pushInAppNotification(
                  title: 'Reset Timer',
                  body: 'Timer has been reset',
                );
                currentTime.value = DateTime.parse('2020-01-01T00:25:00');
                isContinue.value = false;
              },
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                isContinue.value = !isContinue.value;
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
          ],
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
                    () => Text('${currentRound.value}/4'),
                  ),
                  platformTextButton(
                    text: 'RESET',
                    onTap: () {
                      // TODO Reset rounds
                      currentRound.value = 1;
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
                      // TODO Skip if == rounds => break
                      currentRound.value++;
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
