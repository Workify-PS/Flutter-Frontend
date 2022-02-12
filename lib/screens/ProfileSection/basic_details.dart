// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/utils/sizes.dart';

import 'person.dart';
import 'ProfileSectionControllers/profile_details_controller.dart';
import 'package:workify/utils/constants.dart';
// import './modify_history_buttons.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

final profileDetailsController = Get.put(ProfileDetailsController());

class BasicDetails extends StatelessWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    return portrait == false
        ? Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: Row(
                // direction: portrait == true ? Axis.vertical : Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Person(),
                  ),
                  Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  // child: Container(
                  //   width: 500,
                  //   height: double.infinity,
                  //   color: Colors.red,
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'City',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'State',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Country',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  height: double.infinity,
                  color: Colors.transparent
                ),
                Expanded(
                  flex: 5,
                  // child: Container(
                  //   width: 500,
                  //   height: double.infinity,
                  //   color: Colors.amber,
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Email Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.officialMail ??
                                'Email Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Mobile Number Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.mobile ??
                                'Mobile Number Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Date of Birth Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.dob ??
                                'Date of Birth Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('City Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.city??
                                'City Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('State Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.state ??
                                'State Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Country Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.country ??
                                'Country Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),  


                ],
              ),
            ),
          )
        : BasicDetailsPortraitView();
  }
}

class BasicDetailsPortraitView extends StatelessWidget {
  const BasicDetailsPortraitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Person(),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  // child: Container(
                  //   width: 500,
                  //   height: double.infinity,
                  //   color: Colors.red,
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'City',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'State',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'Country',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * 0.1,
                  height: double.infinity,
                  color: Colors.transparent,
                ),
                Expanded(
                  flex: 7,
                  // child: Container(
                  //   width: 500,
                  //   height: double.infinity,
                  //   color: Colors.amber,
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Email Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.officialMail ??
                                'Email Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Mobile Number Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.mobile ??
                                'Mobile Number Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Date of Birth Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.dob ??
                                'Date of Birth Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('City Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.city??
                                'City Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('State Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.state ??
                                'State Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                      Obx(() {
                        if (profileDetailsController.isLoading.value) {
                          return Text('Country Loading');
                        } else {
                          return Text(
                            // 'HI',
                            profileDetailsController
                                    .profileModelDetails?.country ??
                                'Country Null',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Email extends StatelessWidget {
  const Email({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email ID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenWidth * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (profileDetailsController.isLoading.value) {
                return Text('Loading');
              } else {
                return Text(
                  profileDetailsController.profileModelDetails?.officialMail ??
                      'Got Null',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class MobileNumber extends StatelessWidget {
  const MobileNumber({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenWidth * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (profileDetailsController.isLoading.value) {
                return Text('Loading');
              } else {
                return Text(
                  profileDetailsController.profileModelDetails?.mobile ??
                      'Got Null',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class DoB extends StatelessWidget {
  const DoB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenWidth * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (profileDetailsController.isLoading.value) {
                return Text('Loading');
              } else {
                return Text(
                  profileDetailsController.profileModelDetails?.dob ??
                      'Got Null',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class City extends StatelessWidget {
  const City({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenWidth * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (profileDetailsController.isLoading.value) {
                return Text('Loading');
              } else {
                return Text(
                  profileDetailsController.profileModelDetails?.city ??
                      'Got Null',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class State extends StatelessWidget {
  const State({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'State',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenWidth * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (profileDetailsController.isLoading.value) {
                return Text('Loading');
              } else {
                return Text(
                  profileDetailsController.profileModelDetails?.state ??
                      'Got Null',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class Country extends StatelessWidget {
  const Country({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenWidth * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (profileDetailsController.isLoading.value) {
                return Text('Loading');
              } else {
                return Text(
                  profileDetailsController.profileModelDetails?.country ??
                      'Got Null',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class Gender extends StatelessWidget {
  const Gender({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Marital extends StatelessWidget {
  const Marital({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Marital',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Ethnic extends StatelessWidget {
  const Ethnic({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Natinoality',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Indian',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: portrait == true ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
          ),
        ),
        SizedBox(
          // color: Colors.red,
          width: screenHeight * 0.2,
          height: screenHeight * 0.025,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Happy ForeverHappy ForeverHappy ForeverHappy ForeverHappy Forever',
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
