// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:workify/components/DashBoardCard.dart';
// import 'package:workify/components/SideMenu.dart';
import 'package:workify/components/TopBar.dart';
import 'package:workify/components/attendancecard.dart';
import 'package:workify/components/profile_completion_card.dart';
// import 'package:workify/components/button.dart';

import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

class DashBoard extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldkey;
  const DashBoard({
    Key? key,
    required this.parentScaffoldkey,
  }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DeviceSize device = DeviceSize();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(bannerHeight),
          child: TopBar(
            parentScaffoldkey: widget.parentScaffoldkey,
          )),
      body: Container(
        color: kBgDarkColor,
        child: Column(
          children: [
            //SizedBox(height: bannerHeight, child: TopBar()),
            Expanded(
              child: GridView.count(
                controller: ScrollController(),
                crossAxisCount: 3,
                //shrinkWrap: true,
                physics: ScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                children: [
                  AttendanceCard(),
                  ProfileCompletionCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
