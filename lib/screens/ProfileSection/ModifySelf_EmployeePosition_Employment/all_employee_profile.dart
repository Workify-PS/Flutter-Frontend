import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/fetch_all_employees_controller.dart';
import 'package:workify/routes/router.dart';
import 'package:workify/screens/HomePage/HomePageController.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/generators.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/theme.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class AllEmployeeProfile extends StatelessWidget {
  const AllEmployeeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    final fetchAllEmployeesController = Get.find<FetchAllEmployeesController>();

    return Scaffold(
      appBar: generateTopBar(title: "All Employees"),
      body: Center(
        child: Container(
          width: device.size.width / 1.1,
          height: device.size.height / 1.1,
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Material(
            elevation: 20,
            // color: Colors.black,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SizedBox(
              width: screenWidth,
              child: Obx(() {
                if (fetchAllEmployeesController.isLoading.value) {
                  return Text('Still Loading Data');
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                if (portrait)
                                  SizedBox(
                                    width: 10,
                                  ),
                                Expanded(
                                    flex: 3,
                                    child: Text('Employee [ Name : Code ]')),
                                if (portrait)
                                  SizedBox(
                                    width: 10,
                                  ),
                                Expanded(
                                  flex: 3,
                                  child: Text('Designation'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: kDefaultPadding),
                                  child: SizedBox(
                                    width: 140,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 3,
                          color: Colors.grey,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                fetchAllEmployeesController
                                    .allEmployeeList.length,
                                (index) => EmployeeProfile(index: index))),
                      ],
                    ),
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeProfile extends StatelessWidget {
  final int index;
  const EmployeeProfile({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fetchAllEmployeesController = Get.find<FetchAllEmployeesController>();

    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Avatar(name: fetchAllEmployeesController.allEmployeeList[index].firstName??'Buddy'),
                    ),
                  ),
                  if (portrait)
                    SizedBox(
                      width: 10,
                    ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (fetchAllEmployeesController.isLoading.value) {
                        return Text('Still Loading Data');
                      } else {
                        return Text(fetchAllEmployeesController.allEmployeeList
                                .elementAt(index)
                                .fullName
                                .toString() +
                            ' : ' +
                            fetchAllEmployeesController.allEmployeeList
                                .elementAt(index)
                                .empCode
                                .toString());
                      }
                    }),
                  ),
                  if (portrait)
                    SizedBox(
                      width: 10,
                    ),
                  Expanded(
                    flex: 3,
                    child: Obx(() {
                      if (fetchAllEmployeesController.isLoading.value) {
                        return Text('Still Loading Data');
                      } else {
                        return Text(fetchAllEmployeesController.allEmployeeList
                            .elementAt(index)
                            .designation
                            .toString());
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding),
                    child: SizedBox(
                      width: 140,
                      child: Obx(() {
                        if (fetchAllEmployeesController.isLoading.value) {
                          return Text('Still Loading Data');
                        } else {
                          return PrimaryButton(
                            buttonTextWidget: Text('Modify Details'),
                            primaryColor: kPrimaryColor,
                            onPressed: () {
                              Get.find<HomePageController>().gotoPage(
                                  Routes.modifyEmployeeProfile, context,
                                  arguments: index);
                            },
                          );
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color:
                  MyTheme().isDark(context) ? kDividerDarkColor : kDividerColor,
              indent: kDefaultPadding,
              endIndent: kDefaultPadding,
            )
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
     final path = "assets/avatars/avatar${(name.hashCode) % 15}.png";
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // print('\n\n\n Will change avatar Later \n\n\n');
        },
        child: Ink.image(
          image: AssetImage(path),
          fit: BoxFit.contain,
          // width: portrait == true ? screenWidth * 0.2 : screenWidth * 0.25,
          // height: portrait == true ? screenHeight * 0.2 : screenHeight * 0.25,
        ),
      ),
    );
  }
}
