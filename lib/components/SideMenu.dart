import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workify/components/SideMenuItem.dart';

import 'package:workify/utils/constants.dart';

class SideMenu extends StatelessWidget {
  final titles = ["DashBoard", "Attendance", "Profile", "Settings"];
  final icons = [
    Icons.space_dashboard_outlined,
    Icons.list_alt_outlined,
    Icons.person_outline_outlined,
    Icons.settings_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: bannerHeight,
                color: Colors.black12,
                // child: FlutterLogo(
                //   size: 64,
                // ),
              ),
              SizedBox(height: kDefaultPadding),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      titles.length,
                      (index) => SideMenuItem(
                            icon: icons[index],
                            title: titles[index],
                          )),
                ),
              ),
              SizedBox(height: kDefaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }
}
