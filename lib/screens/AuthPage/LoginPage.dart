import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/screens/AuthPage/AuthPageController.dart';
import 'package:workify/utils/constants.dart';

class Login extends GetView<AuthPageController> {
  final GlobalKey<FormState> formKey;
  Login({Key? key, required this.formKey}) : super(key: key);

  final _usernameController = TextEditingController(text: "samarth");
  final _passController = TextEditingController(text: "password");

  final _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      // controller: ScrollController(),
      // shrinkWrap: true,
      // padding: const EdgeInsets.symmetric(vertical: 32),
      //crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 35,
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
          margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  //focusNode: myFocusNode,
                  cursorColor: kBottomShadowColor,
                  controller: _usernameController,
                  validator: (userID) =>
                      userID!.isNotEmpty ? null : "Check your User ID",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'User ID',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: TextFormField(
                  //focusNode: myFocusNode2,
                  cursorColor: kBottomShadowColor,
                  controller: _passController,
                  validator: (pass) =>
                      pass!.isNotEmpty ? null : "Please enter a Password",
                  obscureText: !controller.passwordIsVisible.value,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.passwordIsVisible.value =
                              !(controller.passwordIsVisible.value);
                        },
                        icon: Icon(
                          controller.passwordIsVisible.value
                              ? Icons.visibility_sharp
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                        )),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: controller.forgotPassword,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 4),
                      child: Text(
                        'Forgot Password ?',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.blue, fontSize: 12),
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
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 58),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Login ',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'or',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade50,
                    onPrimary: Colors.black,
                    elevation: 8,
                    shadowColor: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.android,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(width: 12),
                      Text('Sign in with Google'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Future<void> loginAction() async {
    if (formKey.currentState?.validate() ?? false) {
      await _authController.loginUser(
          _usernameController.text, _passController.text);
      Get.toNamed("/home");
    }
  }
}
