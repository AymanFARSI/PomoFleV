import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart' hide MenuItem;
import 'package:system_theme/system_theme.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:pomoflev/variables/variables.dart';
import 'package:window_manager/window_manager.dart';
import 'package:pomoflev/widgets/windows/pane_item.dart';
import 'package:pomoflev/widgets/common/about_screen.dart';
import 'package:pomoflev/widgets/windows/theme_screen.dart';
import 'package:pomoflev/widgets/windows/timer_screen.dart';
import 'package:pomoflev/widgets/windows/config_screen.dart';
import 'package:pomoflev/widgets/common/settings_screen.dart';
import 'package:flutter/material.dart' show Icons hide MenuItem;

class MainWindows extends StatefulWidget {
  const MainWindows({Key? key}) : super(key: key);

  @override
  State<MainWindows> createState() => _MainWindowsState();
}

class _MainWindowsState extends State<MainWindows> with TrayListener {
  int _index = 0;

  @override
  void initState() {
    trayManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    super.dispose();
  }

  @override
  void onTrayIconMouseDown() {
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayIconRightMouseDown() async {
    if (await windowManager.isVisible()) {
      await windowManager.hide();
    } else {
      await windowManager.show();
    }
  }

  @override
  void onTrayIconRightMouseUp() {
    // do something
  }

  @override
  void onTrayMenuItemClick(MenuItem item) {
    debugPrint(item.label);
    if (item.key == 'show_window') {
      debugPrint('show_window');
    } else if (item.key == 'exit_app') {
      debugPrint('exit_app');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'PomoFleV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: SystemTheme.accentColor.accent.toAccentColor(),
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        typography: const Typography.raw(
          caption: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(ui.window.physicalSize.width) ? 2.0 : 0.0,
          borderRadius: BorderRadius.zero,
          glowColor: SystemTheme.accentColor.accent.withOpacity(0.2),
          primaryBorder: const BorderSide(
            width: 2.0,
            // color: theme.inactiveColor ?? Colors.transparent,
          ),
        ),
      ),
      home: NavigationView(
        appBar: NavigationAppBar(
          leading: Obx(
            (() {
              return RadioButton(
                checked: isAlwaysOnTop.value,
                onChanged: (v) async {
                  isAlwaysOnTop.value = v;
                  await windowManager.setAlwaysOnTop(
                    isAlwaysOnTop.value,
                  );
                },
              );
            }),
          ),
          title: GestureDetector(
            onTapDown: (_) async {
              await windowManager.startDragging();
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Center(
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const Text('PomoFleV'),
                    const SizedBox(width: 20),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
          height: is10footScreen(ui.window.physicalSize.width) ? 70 : 50,
          actions: Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              top: 9.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.minimize),
                  onPressed: () async {
                    isMinimizeToTray.value
                        ? await windowManager.hide()
                        : await windowManager.minimize();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                    Get.dialog(
                      FluentTheme(
                        data: ThemeData(),
                        child: ContentDialog(
                          title: const Text(
                            'Are you sure you want to close the app?',
                          ),
                          content: Text(
                            !isMinimizeToTrayOnClose.value
                                ? 'The app will be closed.'
                                : 'You can always open it again from the tray.',
                          ),
                          actions: [
                            Button(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Button(
                              style: ButtonStyle(
                                backgroundColor: ButtonState.all(
                                  const Color(0xff0069ba),
                                ),
                              ),
                              child: Text(
                                !isMinimizeToTrayOnClose.value
                                    ? 'Close'
                                    : 'Minimize',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                Navigator.of(context).pop();
                                !isMinimizeToTrayOnClose.value
                                    ? await windowManager.close()
                                    : await windowManager.hide();
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
          ),
          automaticallyImplyLeading: false,
        ),
        pane: NavigationPane(
          items: [
            customPaneItem(
              icon: FluentIcons.home,
              title: 'Timer',
              count: 0,
            ),
            customPaneItem(
              icon: FluentIcons.settings,
              title: 'Config',
              count: 0,
            ),
            customPaneItem(
              icon: FluentIcons.color,
              title: 'Themes',
              count: 0,
            ),
          ],
          footerItems: [
            customPaneItem(
              icon: FluentIcons.settings_secure,
              title: 'Settings',
              count: 0,
            ),
            customPaneItem(
              icon: FluentIcons.help,
              title: 'About',
              count: 0,
            ),
          ],
          selected: _index,
          onChanged: (_) => setState(() => _index = _),
          displayMode: PaneDisplayMode.compact,
          indicator: const EndNavigationIndicator(),
        ),
        content: NavigationBody(
          index: _index,
          children: const [
            TimerScreen(),
            ConfigScreen(),
            ThemeScreen(),
            ScreenScreen(),
            AboutScreen(),
          ],
        ),
      ),
    );
  }
}
