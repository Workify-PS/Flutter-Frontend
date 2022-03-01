import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/exceptions/print_log.dart';

class LeaveSubTiles extends StatelessWidget {
  const LeaveSubTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageController=Get.find<HomePageController>();

    return Container(
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeaveSubTile(
              leaveOptions: 'My Leaves',
              onTap: () => homePageController.gotoPage(Routes.leave, context)
            ),
            LeaveSubTile(
              leaveOptions: 'All Employee Leaves',
              onTap: () => homePageController.gotoPage(Routes.allEmployeeLeaves, context)
            ),
          ],
        ));
  }
}

// ignore: must_be_immutable
class LeaveSubTile extends StatelessWidget {
  VoidCallback? onTap;
  String leaveOptions;
  // Widget? trailingwidget;

  LeaveSubTile({
    Key? key,
    required this.leaveOptions,
    required this.onTap,
  // this.trailingwidget
  })
      : super(key: key);
  RxBool isSelected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: onTap,
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
