import 'dart:io';
import 'dart:async';
import 'package:get/get.dart';
import 'package:system_tray/system_tray.dart';
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
  String path = Platform.isWindows
      ? 'assets/logos/app_icon.ico'
      : 'assets/logos/icon_flutter.png';

  late Timer timer;
  bool toogleTrayIcon = true;

  final menu = [
    MenuItem(label: 'Show', onClicked: windowManager.show),
    MenuItem(label: 'Hide', onClicked: windowManager.hide),
    MenuItem(
      label: 'Start flash tray icon',
      onClicked: () {
        debugPrint("Start flash tray icon");
        timer = Timer.periodic(
          const Duration(milliseconds: 500),
          (timer) {
            toogleTrayIcon = !toogleTrayIcon;
            systemTray.setImage(toogleTrayIcon ? "" : path);
          },
        );
      },
    ),
    MenuItem(
      label: 'Stop flash tray icon',
      onClicked: () {
        debugPrint("Stop flash tray icon");

        timer.cancel();

        systemTray.setImage(path);
      },
    ),
    MenuSeparator(),
    SubMenu(
      label: "Test API",
      children: [
        SubMenu(
          label: "setSystemTrayInfo",
          children: [
            MenuItem(
              label: 'setTitle',
              onClicked: () {
                systemTray.setTitle("Title");
              },
            ),
            MenuItem(
              label: 'setImage',
              onClicked: () {
                debugPrint("set new image");
                systemTray.setImage(path);
              },
            ),
            MenuItem(
              label: 'setToolTip',
              onClicked: () {
                systemTray.setToolTip("Tooltip");
              },
            ),
            MenuItem(
              label: 'getTitle [macOS]',
              onClicked: () async {
                String title = await systemTray.getTitle();
                debugPrint("click 'getTitle' : $title");
              },
            ),
          ],
        ),
        MenuItem(label: 'disabled Item', enabled: false),
      ],
    ),
    MenuSeparator(),
    MenuItem(
      label: 'Exit',
      onClicked: windowManager.close,
    ),
  ];
  await systemTray.initSystemTray(
    title: "PomoFlev Tray",
    iconPath: path,
    toolTip:
        "PomoFlev - Pomodoro Timer made with 💖 by FARSI Ayman using Flutter",
  );
  await systemTray.setContextMenu(menu);
  systemTray.registerSystemTrayEventHandler(
    (eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == "leftMouseDown") {
        // do something
      } else if (eventName == "leftMouseUp") {
        systemTray.popUpContextMenu();
      } else if (eventName == "rightMouseDown") {
        // do something
      } else if (eventName == "rightMouseUp") {
        windowManager.show();
      }
    },
  );
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
