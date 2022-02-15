import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workify/controllers/AuthController.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FocusNode myFocusNode = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  final _passwordIsVisible = false.obs;
  final _usernameController = TextEditingController(text: "samarth");
  final _passController = TextEditingController(text: "password");
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    return Form(
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
                // height: device.size.height / 1.2,
                padding: EdgeInsets.symmetric(vertical: 28),
                width: device.size.width / 1.2,
                alignment: Alignment.center,
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
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListView(
                            controller: ScrollController(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 32),
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 36),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: TextFormField(
                                        focusNode: myFocusNode,
                                        cursorColor: kBottomShadowColor,
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
                                              color: myFocusNode.hasFocus
                                                  ? Colors.blue
                                                  : Colors.black),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black87)),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Obx(() {
                                        return TextFormField(
                                          focusNode: myFocusNode2,
                                          cursorColor: kBottomShadowColor,
                                          controller: _passController,
                                          validator: (pass) => pass!.isNotEmpty
                                              ? null
                                              : "Please enter a Password",
                                          obscureText:
                                              !_passwordIsVisible.value,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black87)),
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  _passwordIsVisible.value =
                                                      !(_passwordIsVisible
                                                          .value);
                                                },
                                                icon: Icon(
                                                  _passwordIsVisible.value
                                                      ? Icons.visibility_sharp
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Colors.black,
                                                )),
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                color: myFocusNode2.hasFocus
                                                    ? Colors.blue
                                                    : Colors.black),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed('/forgot');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, top: 4),
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
                                          vertical: 4.0, horizontal: 58),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
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
                                          primary: Colors.grey.shade50,
                                          onPrimary: Colors.black,
                                          elevation: 8,
                                          shadowColor: Colors.grey.shade800,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
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
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Future<void> loginAction() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _authController.loginUser(
          _usernameController.text, _passController.text);
      Get.toNamed("/home");
      
    }
  }
}
