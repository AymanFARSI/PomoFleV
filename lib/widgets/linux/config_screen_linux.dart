import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflev/helpers/platform.dart';
import 'package:pomoflev/helpers/time_helpers.dart';
import 'package:pomoflev/src/storage.dart';
import 'package:pomoflev/variables/storage_keys.dart';
import 'package:pomoflev/variables/variables.dart';

class ConfigScreenLinux extends StatelessWidget {
  const ConfigScreenLinux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Config'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Focus Time',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    IconButton(
                      icon: const AdwaitaIcon(
                        AdwaitaIcons.step_back,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Reset'),
                            content: const Text(
                              'Are you sure you want to reset the focus time to 25 minutes?',
                              style: TextStyle(fontSize: 18),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () async {
                                  Get.back();
                                  focusValue.value = getDateTime(minutes: '25');
                                  await writeKey(focus_key, focusValue.value);
                                },
                                child: const Text('Yes'),
                              ),
                              ElevatedButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Obx(
                  () => SizedBox(
                    width: 200,
                    child: Slider(
                      min: 10,
                      max: 60,
                      divisions: 60,
                      value: double.parse(
                        getMinutes(focusValue.value),
                      ),
                      onChanged: (v) => focusValue.value = getDateTime(
                        minutes: v.toInt().toString(),
                      ),
                      onChangeEnd: (v) async {
                        await writeKey(focus_key, getMinutes(focusValue.value));
                        if (!isBreak.value) {
                          currentTime.value = focusValue.value;
                        }
                      },
                      label: getMinutes(focusValue.value),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Short Break Time',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    IconButton(
                      icon: const AdwaitaIcon(
                        AdwaitaIcons.step_back,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Reset'),
                            content: const Text(
                              'Are you sure you want to reset the short break time to 5 minutes?',
                              style: TextStyle(fontSize: 18),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () async {
                                  Get.back();
                                  shortBreakValue.value =
                                      getDateTime(minutes: '05');
                                  await writeKey(
                                      short_break_key, shortBreakValue.value);
                                },
                                child: const Text('Yes'),
                              ),
                              ElevatedButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Obx(
                  () => SizedBox(
                    width: 200,
                    child: Slider(
                      min: 1,
                      max: 60.0,
                      divisions: 60,
                      value: double.parse(
                        getMinutes(shortBreakValue.value),
                      ),
                      onChanged: (v) => shortBreakValue.value = getDateTime(
                        minutes: v.toInt().toString().padLeft(2, '0'),
                      ),
                      onChangeEnd: (v) async {
                        await writeKey(
                          short_break_key,
                          getMinutes(shortBreakValue.value),
                        );
                        if (isBreak.value &&
                            roundsValue.value != roundsValue.value) {
                          currentTime.value = shortBreakValue.value;
                        }
                      },
                      label: getMinutes(shortBreakValue.value),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Long Break Time',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    IconButton(
                      icon: const AdwaitaIcon(
                        AdwaitaIcons.step_back,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Reset'),
                            content: const Text(
                              'Are you sure you want to reset the long break time to 15 minutes?',
                              style: TextStyle(fontSize: 18),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () async {
                                  Get.back();
                                  longBreakValue.value =
                                      getDateTime(minutes: '15');
                                  await writeKey(
                                      long_break_key, longBreakValue.value);
                                },
                                child: const Text('Yes'),
                              ),
                              ElevatedButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Obx(
                  () => SizedBox(
                    width: 200,
                    child: Slider(
                      min: 5,
                      max: 60,
                      divisions: 60,
                      value: double.parse(
                        getMinutes(longBreakValue.value),
                      ),
                      onChanged: (v) => longBreakValue.value = getDateTime(
                        minutes: v.toInt().toString().padLeft(2, '0'),
                      ),
                      onChangeEnd: (v) async {
                        await writeKey(
                          long_break_key,
                          getMinutes(longBreakValue.value),
                        );
                        if (isBreak.value &&
                            currentRound.value == roundsValue.value) {
                          currentTime.value = longBreakValue.value;
                        }
                      },
                      label: getMinutes(longBreakValue.value),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rounds',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    IconButton(
                      icon: const AdwaitaIcon(
                        AdwaitaIcons.step_back,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Reset'),
                            content: const Text(
                              'Are you sure you want to reset the rounds number to 4 rounds?',
                              style: TextStyle(fontSize: 18),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () async {
                                  Get.back();
                                  roundsValue.value = 4;
                                  await writeKey(rounds_key, roundsValue.value);
                                },
                                child: const Text('Yes'),
                              ),
                              ElevatedButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Obx(
                  () => SizedBox(
                    width: 200,
                    child: Slider(
                      min: 1,
                      max: 10,
                      divisions: 10,
                      value: roundsValue.value.toDouble(),
                      onChanged: (v) => roundsValue.value = v.toInt(),
                      onChangeEnd: (v) async {
                        await writeKey(
                          rounds_key,
                          v.toInt().toString().padLeft(2, '0'),
                        );
                      },
                      label: roundsValue.value.toString(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: Get.width,
              child: Row(
                children: [
                  const Expanded(child: SizedBox()),
                  platformResetButton(),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
