import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsItemLinux extends StatelessWidget {
  String title;
  RxBool isChecked;
  Function(bool) onToggle;

  SettingsItemLinux({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(7.0),
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
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
            () => Switch(
              value: isChecked.value,
              onChanged: onToggle,
            ),
          ),
        ],
      ),
    );
  }
}
