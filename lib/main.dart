import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pomoflev/src/initapp.dart';
import 'package:pomoflev/helpers/platform.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pomoflev/widgets/common/custom_error_widget.dart';

main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
