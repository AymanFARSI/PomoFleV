import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflev/variables/variables.dart';
import 'package:pomoflev/widgets/common/about_screen.dart';
import 'package:pomoflev/widgets/common/settings_screen.dart';
import 'package:pomoflev/widgets/linux/timer_screen_linux.dart';
import 'package:pomoflev/widgets/linux/config_screen_linux.dart';
import 'package:pomoflev/widgets/linux/linux_variables.dart';
import 'package:pomoflev/widgets/linux/theme_screen_linux.dart';
import 'package:titlebar_buttons/titlebar_buttons.dart';
import 'package:window_manager/window_manager.dart';

class LinuxWrapper extends StatelessWidget {
  const LinuxWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTapDown: (_) async {
              await windowManager.startDragging();
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Center(
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const Text('PomoFleV'),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
          leading: Obx(
            (() {
              return IconButton(
                onPressed: () async {
                  isAlwaysOnTop.value = !isAlwaysOnTop.value;
                  await windowManager.setAlwaysOnTop(isAlwaysOnTop.value);
                },
                icon: isAlwaysOnTop.value
                    ? const AdwaitaIcon(
                        AdwaitaIcons.circle_filled,
                        color: Colors.black,
                      )
                    : const AdwaitaIcon(
                        AdwaitaIcons.circle_outline_thin,
                        color: Colors.grey,
                      ),
              );
            }),
          ),
          actions: [
            DecoratedMinimizeButton(
              type: themeType.value,
              onPressed: () async => await windowManager.minimize(),
            ),
            DecoratedCloseButton(
              type: themeType.value,
              onPressed: () async => await windowManager.close(),
            ),
            const SizedBox(width: 5),
          ],
        ),
        body: [
          const TimerScreenLinux(),
          const ConfigScreenLinux(),
          const ThemeScreenLinux(),
          const SettingsScreen(),
          const AboutScreen(),
        ].elementAt(currentPage.value),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          items: const [
            BottomNavigationBarItem(
              icon: AdwaitaIcon(
                AdwaitaIcons.user_home,
              ),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: AdwaitaIcon(
                AdwaitaIcons.configure,
              ),
              label: ('Config'),
            ),
            BottomNavigationBarItem(
              icon: AdwaitaIcon(
                AdwaitaIcons.color_select,
              ),
              label: ('Themes'),
            ),
            BottomNavigationBarItem(
              icon: AdwaitaIcon(
                AdwaitaIcons.settings,
              ),
              label: ('Settings'),
            ),
            BottomNavigationBarItem(
              icon: AdwaitaIcon(
                AdwaitaIcons.help_about,
              ),
              label: ('About'),
            ),
          ],
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          type: BottomNavigationBarType.shifting,
          currentIndex: currentPage.value,
          onTap: (index) {
            currentPage.value = index;
          },
          mouseCursor: MaterialStateMouseCursor.clickable,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
