import 'dart:ui' as ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:system_theme/system_theme.dart';

// ignore: must_be_immutable
class CustomFluentButton extends StatelessWidget {
  Widget child;
  CustomFluentButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FluentTheme(
        data: ThemeData(
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
            glowFactor:
                is10footScreen(ui.window.physicalSize.width) ? 2.0 : 0.0,
            borderRadius: BorderRadius.zero,
            glowColor: SystemTheme.accentColor.accent.withOpacity(0.2),
            primaryBorder: const BorderSide(
              width: 2.0,
              // color: theme.inactiveColor ?? Colors.transparent,
            ),
          ),
        ),
        child: child,
      );
}
