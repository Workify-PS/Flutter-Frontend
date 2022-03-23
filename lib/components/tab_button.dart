import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/profile_widgets_controller.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/theme.dart';

class TabButton extends StatefulWidget {
  // method with parameters in stateful widget
  // final void Function(String) profileWidgetHandler;
  // step to call such a method
  // onpressed: () => profileWidgetHandler(profileDetails);

  final String profileDetails;

  TabButton({Key? key, required this.profileDetails}) : super(key: key);

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  final profileWidgetsController = Get.find<ProfileWidgetsController>();
  RxBool isHover = false.obs;
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final screenWidth = device.size.width;
    final screenHeight = device.size.height;
    final portrait = screenWidth < 1000;
    var button = widget.profileDetails == 'Basic Details'
        ? profileWidgetsController.basicButton
        : widget.profileDetails == 'Position Details'
            ? profileWidgetsController.positionButton
            : widget.profileDetails == 'Employment Details'
                ? profileWidgetsController.employmentButton
                : profileWidgetsController.modifyBasicButton;

    return Obx(() => InkWell(
          onTap: () {
            profileWidgetsController.resetButtons();
            profileWidgetsController.updateWidgetString(widget.profileDetails);
            profileWidgetsController.setButton(str: widget.profileDetails);
          },
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onHover: (val) {
            isHover.value = val;
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding / 1.2),
            child: Center(
              child: portrait
                  ? Text(
                      widget.profileDetails,
                      style: button.value
                          ? Theme.of(context).textTheme.headline5!.copyWith(
                                fontSize: 12,
                                color: MyTheme().isDark(context)
                                    ? Colors.lightBlue
                                    : kPrimaryColor,
                              )
                          : Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 12,
                              decoration: isHover.value
                                  ? TextDecoration.underline
                                  : TextDecoration.none),
                    )
                  : Text(
                      widget.profileDetails,
                      style: button.value
                          ? Theme.of(context).textTheme.headline5!.copyWith(
                                color: MyTheme().isDark(context)
                                    ? Colors.lightBlue
                                    : kPrimaryColor,
                              )
                          : Theme.of(context).textTheme.headline5!.copyWith(
                              decoration: isHover.value
                                  ? TextDecoration.underline
                                  : TextDecoration.none),
                    ),
            ),
          ),
        ));
  }
}
