import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:workify/components/button.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';
import 'package:date_time_format/date_time_format.dart';

class DailyAttendanceModel {
  String inTime;
  List<String> outTime = ["--:--"];
  DailyAttendanceModel({
    this.inTime = "--:--",
  });
}

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({Key? key}) : super(key: key);
  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  bool isPunchedIn = false;
  bool isPunchedOut = false;
  final daily = DailyAttendanceModel().obs;
  // final dateinTime = DateTime.now();
  // final dateoutTime = DateTime.now();
  void newintime() {
    daily.update((daily) {
      // daily!.inTime = DateTime.now().hour.toString() +
      //     ":" +
      //     DateTime.now().minute.toString();
      // daily!.inTime = dateinTime.format('H:i');
      daily!.inTime = DateTime.now().format('H:i');
    });
  }

  void newouttime() {
    daily.update((daily) {
      // daily!.outTime.last = DateTime.now().hour.toString() +
      //     ":" +
      //     DateTime.now().minute.toString();
      // daily!.outTime.last = dateoutTime.format('H:i');
      daily!.outTime.last = DateTime.now().format('H:i');
    });
  }

  void punchIn() {
    setState(() {
      isPunchedIn = true;
      isPunchedOut = false;
      newintime();
    });
  }

  void punchOut() {
    setState(() {
      isPunchedIn = true;
      isPunchedOut = true;
      newouttime();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).scaffoldBackgroundColor;
    Color secondaryColor = Theme.of(context).textSelectionColor;

    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 1.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //     width: double.infinity,
          //     height: 160,
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.all(kDefaultPadding),
          //     decoration: BoxDecoration(
          //         color: primaryColor,
          //         borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(16),
          //             bottomRight: Radius.circular(16))),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [

          //         Spacer(),
          //       ],
          //     )),

          InkWell(
            onTap: () {},
            child: NeumorphicButton(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 1.2,
                  vertical: kDefaultPadding * 0.6),
              onPressed: isPunchedIn ? punchOut : punchIn,
              // splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              // hoverColor: Colors.transparent,
              child: Column(
                children: [
                  SvgPicture.asset(
                    isPunchedIn
                        ? "assets/icons/punch_out.svg"
                        : "assets/icons/punch_in.svg",
                    height: 70,
                    fit: BoxFit.fitHeight,
                    color: secondaryColor,
                    //width: 100,
                  ),
                  !isPunchedIn
                      ? Text(
                          "Punch In",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: secondaryColor,
                                  ),
                        )
                      : Text(
                          "Punch Out",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: secondaryColor,
                                  ),
                        )
                ],
              ),
              pressed: isPunchedOut,
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: isPunchedOut ? -5 : 2,
                  // border: NeumorphicBorder(
                  //     color: Theme.of(context).primaryColorDark, width: 1.5),
                  lightSource: LightSource.topLeft,
                  shadowLightColor: Theme.of(context).shadowColor,
                  color: primaryColor),
            ),
          ).neuromorphism(context),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Punch In Time",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: secondaryColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      daily.value.inTime,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: secondaryColor),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                SizedBox(
                  height: 36,
                  child: VerticalDivider(
                    color: secondaryColor,
                    thickness: 0.6,
                    indent: 2,
                    endIndent: 0,
                    width: 20,
                  ),
                ),
                SizedBox(width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Punch Out Time",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: secondaryColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      daily.value.outTime.last,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: secondaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Button(
            buttonTextWidget: Text('Attendance Status'),
            onPressed: () {},
            primaryColor: kPrimaryColor,
            icon: Icon(CupertinoIcons.calendar_today),
          ),
        ],
      ),
    );
  }
}
