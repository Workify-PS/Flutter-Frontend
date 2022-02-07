import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/screens/ProfileSection/profile_history.dart';

import './change_profile_page.dart';

class ModifyHistoryButton extends StatelessWidget {
  const ModifyHistoryButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ModifyButton(),
        HistoryButton(),
      ],
    );
  }
}

class ModifyButton extends StatelessWidget {
  const ModifyButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(ChangeProfilePage());
      },
      child: Center(
        child: Text(
          'Modify',
          // style: TextStyle(
          //   fontSize: screenWidth * 0.01,
          // ),
        ),
      ),
    );
  }
}

class HistoryButton extends StatelessWidget {
  const HistoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(ProfileHistory());
      },
      child: Center(
        child: Text(
          'History',
          // style: TextStyle(
          //   fontSize: screenWidth * 0.01,
          // ),
        ),
      ),
    );
  }
}