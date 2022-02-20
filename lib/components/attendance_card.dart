import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:workify/components/button.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

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

  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColorDark;
    Color secondaryColor = Colors.white;
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Punch In Time",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: secondaryColor),
                          ),
                          Text(
                            daily.value.inTime,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: secondaryColor),
                          ),
                          SizedBox(
                            height: kDefaultPadding * 2,
                          )
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Punch Out Time",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: secondaryColor),
                          ),
                          Text(
                            daily.value.outTime.last,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: secondaryColor),
                          ),
                          SizedBox(
                            height: kDefaultPadding * 2,
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: NeumorphicButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.2),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: secondaryColor,
                                      ),
                                )
                              : Text(
                                  "Punch Out",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: secondaryColor,
                                      ),
                                )
                        ],
                      ),
                      pressed: isPunchedOut,
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: isPunchedOut ? -5 : 10,
                          border: NeumorphicBorder(color: primaryColor),
                          lightSource: LightSource.topLeft,
                          shadowLightColor: Colors.lightBlue.withOpacity(0.7),
                          color: primaryColor),
                    ),
                  ),
                ],
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
