import 'dart:ui' as ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:system_theme/system_theme.dart';

class MainWindows extends StatelessWidget {
  const MainWindows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'PomoFleV',
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
      home: const NavigationView(
        content: Center(
          child: Text('Hello Windows'),
        ),
      ),
    );
  }
}
