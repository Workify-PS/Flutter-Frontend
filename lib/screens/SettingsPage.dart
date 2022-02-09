import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              final themeTobeChanged =
                  MyTheme().isDark(context) ? ThemeMode.light : ThemeMode.dark;
              Get.changeThemeMode(themeTobeChanged);
            },
            child: Icon(
              Icons.switch_camera_outlined,
              //color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
