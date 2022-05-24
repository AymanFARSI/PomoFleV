import 'package:get/get.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:pomoflev/src/initapp.dart';
import 'package:pomoflev/helpers/platform.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pomoflev/widgets/common/custom_error_widget.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TrayListener {
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
    return GetMaterialApp(
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        if (widget != null) {
          return widget;
        } else {
          return const Center(
            child: Text(
              'Something is not right here...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
      debugShowCheckedModeBanner: false,
      home: OverlaySupport(
        child: platformApp(),
      ),
    );
  }
}
