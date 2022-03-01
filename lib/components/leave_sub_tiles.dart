import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/exceptions/print_log.dart';

class LeaveSubTiles extends StatelessWidget {
  const LeaveSubTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeaveSubTile(leaveOptions: 'My Leaves'),
            LeaveSubTile(leaveOptions: 'All Employee Leaves'),
          ],
        ));
  }
}

// ignore: must_be_immutable
class LeaveSubTile extends StatelessWidget {
  final authController = Get.find<AuthController>();

  String leaveOptions;
  LeaveSubTile({Key? key, required this.leaveOptions}) : super(key: key);
  RxBool isSelected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            leaveOptions == 'My Leaves'
                ? {
                    Get.find<HomePageController>().gotoPage(Routes.leave, context)
                  }
                : {
                    Get.find<HomePageController>().gotoPage(Routes.allEmployeeLeaves, context)
                  };
          },
          onHover: (value) => isSelected.value = value,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 1.4,
            ),
            child: Text(
              leaveOptions,
              style: Theme.of(context).textTheme.button!.copyWith(
                  color: isSelected.value ? kPrimaryColor : kGrayColor,
                  fontSize: 13),
            ),
          ),
        ));
  }
}
