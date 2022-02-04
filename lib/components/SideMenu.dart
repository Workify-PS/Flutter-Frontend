// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workify/components/SideMenuItem.dart';

import 'package:workify/utils/constants.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);
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
                width: double.infinity,
                color: Colors.blueGrey,
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/banner.png",
                  fit: BoxFit.contain,
                  color: kBgLightColor,
                ),
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
