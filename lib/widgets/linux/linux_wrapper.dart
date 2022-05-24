import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflev/variables/variables.dart';
import 'package:pomoflev/widgets/common/about_screen.dart';
import 'package:pomoflev/widgets/common/settings_screen.dart';
import 'package:pomoflev/widgets/linux/linux_variables.dart';
import 'package:titlebar_buttons/titlebar_buttons.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_icons/yaru_icons.dart';

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
                    ? const Icon(
                        YaruIcons.media_optical_filled,
                        color: Colors.black,
                      )
                    : const Icon(
                        YaruIcons.media_optical,
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
          Center(
            child: Text('Home ${currentPage.value}'),
          ),
          Center(
            child: Text('Config ${currentPage.value}'),
          ),
          Center(
            child: Text('Themes ${currentPage.value}'),
          ),
          const ScreenScreen(),
          const AboutScreen(),
        ].elementAt(currentPage.value),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(YaruIcons.home),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(YaruIcons.sidebar),
              label: ('Config'),
            ),
            BottomNavigationBarItem(
              icon: Icon(YaruIcons.colors),
              label: ('Themes'),
            ),
            BottomNavigationBarItem(
              icon: Icon(YaruIcons.settings),
              label: ('Settings'),
            ),
            BottomNavigationBarItem(
              icon: Icon(YaruIcons.view_more_horizontal),
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
