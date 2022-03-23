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
        padding: const EdgeInsets.only(top: kDefaultPadding / 1.5,),
        child: LeaveSubTile(
          leaveOptions: 'My Leaves',
          onTap: () => homePageController.gotoPage(Routes.leave, context)
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
          child: Text(
            leaveOptions,
            style: Theme.of(context).textTheme.button!.copyWith(
                color: isSelected.value ? kPrimaryColor : kGrayColor,
                fontSize: 13),
          ),
        ));
  }
}
