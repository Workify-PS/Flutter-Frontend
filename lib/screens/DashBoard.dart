import 'package:flutter/material.dart';
import 'package:workify/components/birthday_card.dart';
import 'package:workify/components/dashboard_card.dart';
import 'package:workify/components/profile_completion_card.dart';
import 'package:workify/components/top_bar.dart';
import 'package:workify/components/attendance_card.dart';
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

                crossAxisSpacing: kDefaultPadding * 2,
                mainAxisSpacing: kDefaultPadding * 2,

                //shrinkWrap: true,
                physics: ScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                children: [
                  ProfileCompletionCard(),
                  AttendanceCard(),
                  BirthdayCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
