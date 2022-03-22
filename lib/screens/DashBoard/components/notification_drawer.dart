import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/screens/LeavePage/AllEmployeeLeaves.dart';
import 'package:workify/utils/constants.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({Key? key}) : super(key: key);

  get bannerHeight => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: bannerHeight,
                  margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 1.5),
                        child: Icon(
                          Icons.notifications_on_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        "Notifications",
                        style: Theme.of(context).primaryTextTheme.headline5,
                      ),
                    ],
                  ),
              ),
              SizedBox(height: kDefaultPadding),

              LeaveRelated(),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaveRelated extends StatelessWidget {
  LeaveRelated({Key? key}) : super(key: key);

  final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8,left: 20),
          child: Text(
            'Leave Related',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Column(
          children: List.generate(allEmployeeLeavesController.leaveList.length,
              (index) => EmployeeLeaveResponse(index: index)),
        )
      ],
    );
  }
}

class EmployeeLeaveResponse extends StatelessWidget {
  final index;
  EmployeeLeaveResponse({Key? key, required this.index}) : super(key: key);

  final allEmployeeLeavesController = Get.find<AllEmployeeLeavesController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return Text(allEmployeeLeavesController.leaveList[index].userName
                      .toString() +
                  ' : ' +
                  allEmployeeLeavesController.leaveList[index].leaveType
                      .toString());
            }),
            PrimaryButton(
                buttonTextWidget: Text('Respond'),
                primaryColor: Colors.amber,
                onPressed: () {
                  Get.find<HomePageController>()
                      .gotoPage(Routes.allEmployeeLeaves, context);
                }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            height: 3,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
