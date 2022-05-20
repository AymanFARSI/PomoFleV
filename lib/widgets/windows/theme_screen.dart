import 'package:fluent_ui/fluent_ui.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Center(child: Text('Theming')),
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
