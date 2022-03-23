import 'package:flutter/material.dart';
import 'package:workify/components/holiday_card.dart';
import 'package:workify/components/wish_card.dart';
import 'package:workify/components/dashboard_card.dart';
import 'package:workify/components/profile_completion_card.dart';
import 'package:workify/components/top_bar.dart';
import 'package:workify/components/attendance_card.dart';
import 'package:workify/screens/DashBoard/components/dash_top_bar.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

class DashBoard extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldkey;
  const DashBoard({
    Key? key,
    this.parentScaffoldkey,
  }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DeviceSize device = DeviceSize();
  DateTime dt = DateTime.now();
  final cards = [
    ProfileCompletionCard(),
    AttendanceCard(),
    WishCard(),
    HolidaysCard(),
  ];

  final titles = ["Profile", "Attendance", "Wish", "Holidays"];
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
  DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;
    portrait = screenWidth < 1000;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(bannerHeight),
          child: TopBar(
            customTopBar: DashTopBar(),
            title: "Home",
          )),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: GridView.builder(
          itemCount: cards.length,
          controller: ScrollController(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 550,
            crossAxisSpacing: kDefaultPadding * 4,
            mainAxisSpacing: kDefaultPadding * 2,
            childAspectRatio: portrait?0.8:1.2,
            //mainAxisExtent: 400,
          ),

          itemBuilder: (context, index) =>
              DashBoardCard(child: cards[index], title: titles[index]),
          //shrinkWrap: true,
          physics: ScrollPhysics(),
          shrinkWrap: true,

          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        ),
      ),
    );
  }
}
