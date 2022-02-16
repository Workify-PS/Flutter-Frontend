import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';
import 'package:workify/screens/AuthPage/ForgotPass.dart';
import 'package:workify/screens/AuthPage/LoginPage.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

class AuthPage extends GetView<AuthPageController> {
  // FocusNode myFocusNode = FocusNode();
  // FocusNode myFocusNode2 = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final pageController = Get.find<AuthPageController>();

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;

    return Obx(() => Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.indigo, Colors.teal],
            )),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Container(
                    height: 500,
                    //padding: EdgeInsets.symmetric(vertical: 28),
                    width: 1200,
                    child: Card(
                      elevation: 100,
                      color: Colors.grey.shade300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Image.asset(
                              'assets/images/banner512_nobg.png',
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: controller.hasForgotPassword.value
                                  ? ForgotPass(formKey: _formKey)
                                  : Login(formKey: _formKey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ));
  }
}
