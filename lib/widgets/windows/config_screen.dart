import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show AlertDialog;
import 'package:get/get.dart';
import 'package:pomoflev/helpers/time_helpers.dart';
import 'package:pomoflev/src/storage.dart';
import 'package:pomoflev/variables/storage_keys.dart';
import 'package:pomoflev/variables/variables.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Center(child: Text('Pomodoro Config')),
      ),
      content: SizedBox(
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
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(FluentIcons.reset),
                  onPressed: () {
                    Get.dialog(
                      FluentTheme(
                        data: FluentTheme.of(context).copyWith(),
                        child: AlertDialog(
                          title: const Text('Reset'),
                          content: const Text(
                            'Are you sure you want to reset the focus time to 25 minutes?',
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            Button(
                              style: ButtonStyle(
                                backgroundColor: ButtonState.all(Colors.purple),
                                foregroundColor: ButtonState.all(Colors.white),
                              ),
                              onPressed: () async {
                                Get.back();
                                focusValue.value = getDateTime(minutes: '25');
                                await writeKey(focus_key, focusValue.value);
                              },
                              child: const Text('Yes'),
                            ),
                            Button(
                              child: const Text('No'),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            Obx(
              () => SizedBox(
                width: 200,
                child: Slider(
                  min: 10,
                  max: 60,
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
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Short Break Time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(FluentIcons.reset),
                  onPressed: () {
                    Get.dialog(
                      FluentTheme(
                        data: FluentTheme.of(context).copyWith(),
                        child: AlertDialog(
                          title: const Text('Reset'),
                          content: const Text(
                            'Are you sure you want to reset the short break time to 5 minutes?',
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            Button(
                              style: ButtonStyle(
                                backgroundColor: ButtonState.all(Colors.purple),
                                foregroundColor: ButtonState.all(Colors.white),
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
                            Button(
                              child: const Text('No'),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            Obx(
              () => SizedBox(
                width: 200,
                child: Slider(
                  min: 1,
                  max: 60.0,
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
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Long Break Time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(FluentIcons.reset),
                  onPressed: () {
                    Get.dialog(
                      FluentTheme(
                        data: FluentTheme.of(context).copyWith(),
                        child: AlertDialog(
                          title: const Text('Reset'),
                          content: const Text(
                            'Are you sure you want to reset the long break time to 15 minutes?',
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            Button(
                              style: ButtonStyle(
                                backgroundColor: ButtonState.all(Colors.purple),
                                foregroundColor: ButtonState.all(Colors.white),
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
                            Button(
                              child: const Text('No'),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            Obx(
              () => SizedBox(
                width: 200,
                child: Slider(
                  min: 5,
                  max: 60,
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
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Rounds',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(FluentIcons.reset),
                  onPressed: () {
                    Get.dialog(
                      FluentTheme(
                        data: FluentTheme.of(context).copyWith(),
                        child: AlertDialog(
                          title: const Text('Reset'),
                          content: const Text(
                            'Are you sure you want to reset the rounds number to 4 rounds?',
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            Button(
                              style: ButtonStyle(
                                backgroundColor: ButtonState.all(Colors.purple),
                                foregroundColor: ButtonState.all(Colors.white),
                              ),
                              onPressed: () async {
                                Get.back();
                                roundsValue.value = 4;
                                await writeKey(rounds_key, roundsValue.value);
                              },
                              child: const Text('Yes'),
                            ),
                            Button(
                              child: const Text('No'),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            Obx(
              () => SizedBox(
                width: 200,
                child: Slider(
                  min: 1,
                  max: 10,
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
      bottomBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          top: 15,
        ),
        child: Button(
          onPressed: () async {
            await writeKey(focus_key, '25');
            await writeKey(short_break_key, '05');
            await writeKey(long_break_key, '15');
            await writeKey(rounds_key, '4');
            focusValue.value = getDateTime(minutes: '25');
            shortBreakValue.value = getDateTime(minutes: '05');
            longBreakValue.value = getDateTime(minutes: '15');
            roundsValue.value = 4;
          },
          style: ButtonStyle(
            backgroundColor: ButtonState.all(Colors.white),
            foregroundColor: ButtonState.all(Colors.black),
            border: ButtonState.all(
              const BorderSide(
                color: Colors.black,
                width: 0.3,
              ),
            ),
            elevation: ButtonState.all(3),
            shape: ButtonState.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            textStyle: ButtonState.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            shadowColor: ButtonState.all(Colors.black),
            padding: ButtonState.all(
              const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 7,
              ),
            ),
          ),
          child: const Text(
            'Reset Config',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
