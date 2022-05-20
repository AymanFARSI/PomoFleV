import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart';

// ignore: must_be_immutable
class SettingsItem extends StatelessWidget {
  String title;
  RxBool isChecked;
  Function(bool) onToggle;

  SettingsItem({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      borderRadius: BorderRadius.circular(9),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          Expanded(child: Container()),
          Obx(
            () => ToggleSwitch(
              checked: isChecked.value,
              onChanged: onToggle,
              content: Text(
                isChecked.value ? 'On' : 'Off',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
