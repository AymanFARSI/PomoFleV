import 'package:fluent_ui/fluent_ui.dart';

PaneItem customPaneItem({
  required IconData icon,
  required String title,
  required int count,
}) =>
    PaneItem(
      icon: Icon(icon),
      title: Text(title),
      infoBadge: count > 0
          ? InfoBadge(
              source: Text(
                count.toString(),
              ),
              color: Colors.teal,
              foregroundColor: Colors.black,
            )
          : null,
    );
