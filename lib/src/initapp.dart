import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, Colors, Size;

import 'package:pomoflev/src/read_storage.dart';
import 'package:pomoflev/variables/variables.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await readStorage();
  if (GetPlatform.isDesktop) {
    await initDesktop();
  } else if (GetPlatform.isWeb) {
    await initWeb();
  } else {
    await initMobile();
  }
}

initDesktop() async {
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    minimumSize: const Size(500, 600),
    size: const Size(500, 600),
    maximumSize: const Size(750, 850),
    title: 'PomoFleV',
    alwaysOnTop: isAlwaysOnTop.value,
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

initMobile() async {}

initWeb() async {}
