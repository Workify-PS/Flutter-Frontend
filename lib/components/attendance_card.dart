import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/button.dart';
import 'package:workify/models/DailyAttendanceModel.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({Key? key}) : super(key: key);
  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  bool isPunchedIn = false;
  Color primaryColor = Colors.amber.shade600;
  final daily = DailyAttendanceModel().obs;

  void newintime() {
    daily.update((daily) {
      daily!.inTime = DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString();
    });
  }

  void newouttime() {
    daily.update((daily) {
      daily!.outTime.last = DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString();
    });
  }

  void punchIn() {
    setState(() {
      isPunchedIn = true;
      newintime();
    });
  }

  void punchOut() {
    setState(() {
      isPunchedIn = false;
      newouttime();
    });
  }

  Widget build(BuildContext context) {
    Color accentColor =
        MyTheme().isDark(context) ? kDividerColor : Colors.black87;
    return Container(
      margin: const EdgeInsets.only(right: kDefaultPadding * 3),
      padding: EdgeInsets.only(top: kDefaultPadding * 1.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: double.infinity,
              height: 160,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(kDefaultPadding * 1.5),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Neumorphic(
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  color: Colors.black.withOpacity(0.02),
                  onPressed: isPunchedIn ? punchOut : punchIn,
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: SvgPicture.asset(
                    isPunchedIn
                        ? "assets/icons/punch_out.svg"
                        : "assets/icons/punch_in.svg",
                    height: 90,
                    color: Colors.white,
                    width: 5,
                  ),
                ),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: isPunchedIn ? -5 : 5,
                    border: NeumorphicBorder(color: primaryColor),
                    lightSource: LightSource.topLeft,
                    shadowLightColor: Colors.white54,
                    surfaceIntensity: 0.5,
                    color: primaryColor),
              )

              // : Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Column(
              //         children: [
              //           ElevatedButton(
              //             style: ButtonStyle(
              //               shape: MaterialStateProperty.all<
              //                   RoundedRectangleBorder>(
              //                 RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(90.0)),
              //               ),
              //               // foregroundColor: getColor(Colors.black, Colors.grey),
              //               // backgroundColor: getColor(kSecondaryColor, Colors.red),
              //             ),
              //             onPressed: isPunchedIn ? null : _dis,
              //             // _ispressed == false ? _callback : null,
              //             child: SvgPicture.asset(
              //               "assets/icons/punch_in.svg",
              //               height: 70,
              //               color: accentColor,
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text('Punch IN Time'),
              //           ),
              //           Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Obx(
              //                 () => Text(daily.value.inTime),
              //               )),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           ElevatedButton(
              //             style: ButtonStyle(
              //                 shape: MaterialStateProperty.all<
              //                         RoundedRectangleBorder>(
              //                     RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(90.0)))),
              //             onPressed: () {
              //               newouttime();
              //             },
              //             child: SvgPicture.asset(
              //               "assets/icons/punch_out.svg",
              //               height: 70,
              //               color: accentColor,
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text('Punch OUT Time'),
              //           ),
              //           Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Obx(
              //                 () => Text(daily.value.outTime.last),
              //               )),
              //         ],
              //       ),
              //     ],
              //   ),

              // SizedBox(
              //   height: 19,
              // ),
              ),
          Spacer(),
          Button(
            buttonTextWidget: Text('ATTENDANCE STATUS'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
