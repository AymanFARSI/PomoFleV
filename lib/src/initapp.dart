import 'package:flutter/widgets.dart';
import 'package:pomoflev/src/read_storage.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await readStorage();
}
