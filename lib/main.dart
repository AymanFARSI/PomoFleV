import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflev/helpers/platform.dart';
import 'package:pomoflev/src/initapp.dart';

main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: platformApp(),
    );
  }
}
