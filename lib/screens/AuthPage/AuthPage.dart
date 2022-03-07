import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';
import 'package:workify/screens/AuthPage/ForgotPass.dart';

import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/responsive.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/utils/theme.dart';

class AuthPage extends GetView<AuthPageController> {
  final _formKey = GlobalKey<FormState>();

  final pageController = Get.find<AuthPageController>();
  final _usernameController = TextEditingController(text: "");
  final _passController = TextEditingController(text: "password");

  final _authController = Get.find<AuthController>();
  FocusNode userIDFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode enterFocus = FocusNode();
  late String filePath;
  final RxBool _switchVal = false.obs;
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(enterFocus);
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    filePath = MyTheme().isDark(context)
        ? 'assets/images/banner512_nobgdark.png'
        : 'assets/images/banner512_nobg.png';

    return Obx(() => RawKeyboardListener(
          focusNode: enterFocus,
          autofocus: true,
          onKey: (RawKeyEvent event) {
            if (event.data.logicalKey == LogicalKeyboardKey.enter) {
              if (_formKey.currentState?.validate() ?? false) {
                loginAction();
              }
            }
          },
          child: Form(
            key: _formKey,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: MyTheme().isDark(context)
                    ? true
                        ? [Colors.indigo.shade700, Colors.teal.shade700]
                        : [kTopShadowColorDark, kWhaleColor]
                    : [Colors.indigo, Colors.teal],
              )),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Responsivescreen(
                      mobile: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 100, horizontal: 28),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: controller.hasForgotPassword.value
                            ? ForgotPass(formKey: _formKey)
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'LOGIN',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Please Login to Your Account',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 48, vertical: 36),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: TextFormField(
                                            autofocus: true,
                                            focusNode: userIDFocus,
                                            cursorColor: kPrimaryColor,
                                            controller: _usernameController,
                                            validator: (userID) =>
                                                userID!.isNotEmpty
                                                    ? null
                                                    : "Check your User ID",
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'User ID',
                                              labelStyle: TextStyle(
                                                  color: userIDFocus.hasFocus
                                                      ? kPrimaryColor
                                                      : Theme.of(context)
                                                          .primaryTextTheme
                                                          .headline1!
                                                          .color),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kPrimaryColor,
                                                      width: 1.5)),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: TextFormField(
                                            focusNode: passFocus,
                                            cursorColor: kPrimaryColor,
                                            controller: _passController,
                                            validator: (pass) =>
                                                pass!.isNotEmpty
                                                    ? null
                                                    : "Please enter a Password",
                                            obscureText: !controller
                                                .passwordIsVisible.value,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kPrimaryColor,
                                                    width: 1.5),
                                              ),
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    controller.passwordIsVisible
                                                            .value =
                                                        !(controller
                                                            .passwordIsVisible
                                                            .value);
                                                  },
                                                  icon: Icon(
                                                    controller.passwordIsVisible
                                                            .value
                                                        ? Icons.visibility_sharp
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color,
                                                  )),
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                  color: passFocus.hasFocus
                                                      ? kPrimaryColor
                                                      : Theme.of(context)
                                                          .primaryTextTheme
                                                          .headline1!
                                                          .color),
                                              //floatingLabelStyle: TextStyle(color: kPrimaryColor),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: controller.forgotPassword,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0, top: 8),
                                                child: Text(
                                                  'Forgot Password ?',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: loginAction,
                                        style: ElevatedButton.styleFrom(
                                            primary: kPrimaryColor,
                                            onPrimary: Colors.white,
                                            elevation: 8,
                                            shadowColor: Colors.grey.shade800,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0, horizontal: 50),
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              Text(
                                                'Login ',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          'or',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              //primary: Colors.grey.shade50,
                                              onPrimary: Colors.black,
                                              elevation: 6,
                                              shadowColor: Colors.grey.shade800,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0, horizontal: 10),
                                            child: Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.android,
                                                  color: Colors
                                                      .greenAccent.shade700,
                                                ),
                                                SizedBox(width: 12),
                                                Text(
                                                  'Sign in with Google',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ).neuromorphism(context)
                                    ],
                                  ),
                                ],
                              ),
                      ),
                      child: Container(
                        height: 500,
                        //padding: EdgeInsets.symmetric(vertical: 28),
                        width: 1100,
                        child: Card(
                          elevation: 100,
                          color: Theme.of(context).secondaryHeaderColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(
                                  filePath,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: controller.hasForgotPassword.value
                                          ? ForgotPass(formKey: _formKey)
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'LOGIN',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              const TextStyle(
                                                            fontSize: 35,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Please Login to Your Account',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: GoogleFonts.lato(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 48,
                                                      vertical: 36),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 10.0),
                                                        child: TextFormField(
                                                          autofocus: true,
                                                          focusNode:
                                                              userIDFocus,
                                                          cursorColor:
                                                              kPrimaryColor,
                                                          controller:
                                                              _usernameController,
                                                          validator: (userID) =>
                                                              userID!.isNotEmpty
                                                                  ? null
                                                                  : "Check your User ID",
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'User ID',
                                                            labelStyle: TextStyle(
                                                                color: userIDFocus
                                                                        .hasFocus
                                                                    ? kPrimaryColor
                                                                    : Theme.of(
                                                                            context)
                                                                        .primaryTextTheme
                                                                        .headline1!
                                                                        .color),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            kPrimaryColor,
                                                                        width:
                                                                            1.5)),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 12.0),
                                                        child: TextFormField(
                                                          focusNode: passFocus,
                                                          cursorColor:
                                                              kPrimaryColor,
                                                          controller:
                                                              _passController,
                                                          validator: (pass) =>
                                                              pass!.isNotEmpty
                                                                  ? null
                                                                  : "Please enter a Password",
                                                          obscureText: !controller
                                                              .passwordIsVisible
                                                              .value,
                                                          decoration:
                                                              InputDecoration(
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          kPrimaryColor,
                                                                      width:
                                                                          1.5),
                                                            ),
                                                            suffixIcon:
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                              .passwordIsVisible
                                                                              .value =
                                                                          !(controller
                                                                              .passwordIsVisible
                                                                              .value);
                                                                    },
                                                                    icon: Icon(
                                                                      controller
                                                                              .passwordIsVisible
                                                                              .value
                                                                          ? Icons
                                                                              .visibility_sharp
                                                                          : Icons
                                                                              .visibility_off_outlined,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyText1!
                                                                          .color,
                                                                    )),
                                                            labelText:
                                                                'Password',
                                                            labelStyle: TextStyle(
                                                                color: passFocus
                                                                        .hasFocus
                                                                    ? kPrimaryColor
                                                                    : Theme.of(
                                                                            context)
                                                                        .primaryTextTheme
                                                                        .headline1!
                                                                        .color),
                                                            //floatingLabelStyle: TextStyle(color: kPrimaryColor),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 2),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                            onTap: controller
                                                                .forgotPassword,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          8.0,
                                                                      top: 8),
                                                              child: Text(
                                                                'Forgot Password ?',
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: loginAction,
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  kPrimaryColor,
                                                              onPrimary:
                                                                  Colors.white,
                                                              elevation: 8,
                                                              shadowColor:
                                                                  Colors.grey
                                                                      .shade800,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              )),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 2.0,
                                                                horizontal:
                                                                    100),
                                                        child: Wrap(
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Login ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 8),
                                                      child: Text(
                                                        'or',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                //primary: Colors.grey.shade50,
                                                                onPrimary:
                                                                    Colors
                                                                        .black,
                                                                elevation: 6,
                                                                shadowColor:
                                                                    Colors.grey
                                                                        .shade800,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                )),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 2.0,
                                                                  horizontal:
                                                                      40),
                                                          child: Wrap(
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.android,
                                                                color: Colors
                                                                    .greenAccent
                                                                    .shade700,
                                                              ),
                                                              SizedBox(
                                                                  width: 12),
                                                              Text(
                                                                'Sign in with Google',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ).neuromorphism(context)
                                                  ],
                                                ),
                                              ],
                                            ),
                                    ),
                                    // Positioned(
                                    //   child: CupertinoSwitch(
                                    //       value: _switchVal.value,
                                    //       onChanged: (value) {
                                    //         _switchVal.value = value;
                                    //       }),
                                    //   top: 10,
                                    //   right: 10,
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ));
  }

  Future<void> loginAction() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _authController.loginUser(
          username: _usernameController.text, password: _passController.text);
      Get.toNamed("/home");
    }
  }
}
