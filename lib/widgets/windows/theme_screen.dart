import 'package:fluent_ui/fluent_ui.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Center(child: Text('Theming')),
      ),
      content: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            'Coming soon',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
