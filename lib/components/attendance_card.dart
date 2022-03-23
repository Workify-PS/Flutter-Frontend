import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/AttendanceCardController.dart';
import 'package:workify/models/DailyAttendanceModel.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/assets.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';
import 'package:date_time_format/date_time_format.dart';

class AttendanceCard extends GetView<AttendanceCardController> {
  const AttendanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).scaffoldBackgroundColor;
    Color secondaryColor = Theme.of(context).textSelectionColor;

    return Obx(() => Container(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: NeumorphicButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 1.2,
                      vertical: kDefaultPadding * 0.6),
                  onPressed: controller.isPunchedIn.value
                      ? controller.punchOut
                      : controller.punchIn,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        controller.isPunchedIn.value
                            ? Assets.punchOut
                            : Assets.punchIn,
                        height: 70,
                        fit: BoxFit.fitHeight,
                        color: secondaryColor,
                        //width: 100,
                      ),
                      !controller.isPunchedIn.value
                          ? Text(
                              translator.translate("Punch In"),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: secondaryColor,
                                  ),
                            )
                          : Text(
                              translator.translate("Punch Out"),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: secondaryColor,
                                  ),
                            )
                    ],
                  ),
                  pressed: controller.isPunchedOut.value,
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      depth: 8,
                      // border: NeumorphicBorder(
                      //     color: Theme.of(context).primaryColorDark, width: 1.5),
                      lightSource: LightSource.right,
                      //shadowDarkColor: kTopShadowColorDark,

                      shadowLightColor: Theme.of(context).shadowColor,
                      color: primaryColor),
                ),
              ),
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
                          translator.translate("Punch In Time"),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: secondaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.daily.value.inTime,
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
                          translator.translate("Punch Out Time"),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: secondaryColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.daily.value.outTime.last,
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
              PrimaryButton(
                buttonTextWidget: Text(translator.translate('Attendance Status')),
                onPressed: () {
                  Get.find<HomePageController>()
                      .gotoPage("/attendance", context);
                },
                primaryColor: kPrimaryColor,
                icon: Icon(CupertinoIcons.calendar_today),
              ),
            ],
          ),
        ));
  }
}
