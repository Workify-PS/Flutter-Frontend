import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/AuthPage/AuthController.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              print('\n\nIn SettingsPage.dart \n\n');
              print('Button Tapped');
            },
            child: Icon(
              Icons.exit_to_app,
              //color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
