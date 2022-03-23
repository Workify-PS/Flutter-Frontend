import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/modify_profile_widgets_controller.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class ModifyButton extends StatefulWidget {
  final String ModifyEmployeeProfileDetailsString;
  // final int buttonIndex;
  ModifyButton({
    Key? key,
    required this.ModifyEmployeeProfileDetailsString,
    // required this.buttonIndex
  }) : super(key: key);

  @override
  State<ModifyButton> createState() => _ModifyButtonState();
}

class _ModifyButtonState extends State<ModifyButton> {
  RxBool isHover = false.obs;
  final modifyProfileWidgetsController =
      Get.find<ModifyProfileWidgetsController>();
  @override
  Widget build(BuildContext context) {
    var button = widget.ModifyEmployeeProfileDetailsString ==
            'Employee Basic Details'
        ? modifyProfileWidgetsController.employeeBasicDetailsButton
        : widget.ModifyEmployeeProfileDetailsString == 'Modify Position Details'
            ? modifyProfileWidgetsController.modifyPositionButton
            : modifyProfileWidgetsController.modifyEmploymentButton;

    return Obx(() => InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            modifyProfileWidgetsController.resetModifyProfileButtons();
            modifyProfileWidgetsController.updateModifyProfileWidgetString(
                widget.ModifyEmployeeProfileDetailsString);
            modifyProfileWidgetsController.setModifyProfileButton(
                str: widget.ModifyEmployeeProfileDetailsString);
          },
          onHover: (val) {
            isHover.value = val;
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding / 1.2),
            child: Center(
              child: Text(
                widget.ModifyEmployeeProfileDetailsString ,
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
