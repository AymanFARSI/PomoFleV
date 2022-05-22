import 'dart:io';
import 'dart:async';
import 'package:get/get.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart'
    hide MenuItem
    show Colors, Size, WidgetsFlutterBinding, debugPrint;

import 'package:pomoflev/src/storage.dart';
import 'package:pomoflev/variables/variables.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await readStorage();
  if (GetPlatform.isDesktop) {
    await initDesktop();
    await initSystemTray();
  } else if (GetPlatform.isWeb) {
    await initWeb();
  } else {
    await initMobile();
  }
}

initSystemTray() async {
  await trayManager.setIcon(
    Platform.isWindows
        ? 'assets/logos/app_icon.ico'
        : 'assets/logos/pomoflev_logo.png',
  );
  await trayManager.setContextMenu(
    Menu(
      items: items,
    ),
  );
  await trayManager.setToolTip('PomoFlev by FARSI Ayman');
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
