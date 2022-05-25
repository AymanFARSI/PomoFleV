import 'package:fluent_ui/fluent_ui.dart';
import 'package:pomoflev/widgets/common/theme_screen.dart';

class ThemeScreenWindows extends StatelessWidget {
  const ThemeScreenWindows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Center(child: Text('Theming')),
      ),
      content: ThemeScreen(),
    );
  }
}
