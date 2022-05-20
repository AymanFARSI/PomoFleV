import 'package:fluent_ui/fluent_ui.dart';

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
        child: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
