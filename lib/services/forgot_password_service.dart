import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/services/change_password_service.dart';
import 'package:workify/utils/constants.dart';

class ForgotPasswordService {
  static Future<void> callForgotPasswordApi({data}) async {
    String forgotPasswordUrl = 'http://localhost:8080/workify/v1/login/forgot';
    try {
      var headers = {'Content-Type': 'application/json'};

      final Dio dio = Dio();
      dio.options.headers = headers;

      data = json.encode(data);
      Get.defaultDialog(
        radius: 8,
        barrierDismissible: false,
        backgroundColor: Colors.grey.shade200,
        title: 'Sending OTP',
        content: CircularProgressIndicator(
          color: kPrimaryColor,
        ));
      var response = await dio.post(forgotPasswordUrl, data: data);
      Get.back();

      if (response.statusCode == 200) {
        Get.defaultDialog(
          radius: 8,
          barrierDismissible: false,
          backgroundColor: Colors.grey.shade200,
          title: 'Please enter OTP received on mail',
          content: VerifyOtpWidget(),
        );

        PrintLog.printLog(
            fileName: 'Forgot Password Service File',
            functionName: 'callForgotPasswordApi(){}',
            blockNumber: 1,
            printStatement: 'OTP sent Successfully !!\n\n');
      } else {
        PrintLog.printLog(
            fileName: 'Forgot Password Service File',
            functionName: 'callForgotPasswordApi(){}',
            blockNumber: 2,
            printStatement:
                'Response Status Code :\n' + response.statusCode.toString());
      }
    } on DioError catch (error) {
      PrintLog.printLog(
          fileName: 'Forgot Password Service File',
          functionName: 'callForgotPasswordApi(){}',
          blockNumber: 3,
          printStatement: error.message);
    }
  }
}

class VerifyOtpWidget extends StatelessWidget {
  const VerifyOtpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _otpController = TextEditingController();

    Future<void> callVerifyOtpApi({data}) async {
      String verifyOtpUrl = 'http://localhost:8080/workify/v1/login/verifyotp';
      try {
        var headers = {'Content-Type': 'application/json'};

        final Dio dio = Dio();
        dio.options.headers = headers;

        data = json.encode(data);

        var response = await dio.post(verifyOtpUrl, data: data);

        if (response.statusCode == 200) {
          if (response.toString() == 'true') {
            Get.back();
            Get.defaultDialog(
            radius: 8,
            barrierDismissible: false,
            backgroundColor: Colors.grey.shade200,
            title: 'Please change your password',
            content: ForgotPasswordWidget(),
            );
          } else {
            Get.defaultDialog(
              radius:8,
              backgroundColor: Colors.grey.shade200,
              title: 'Wrong OTP!', middleText: 'Please check for latest OTP');
          }
        } else {
          PrintLog.printLog(
              fileName: 'Forgot Password Service File',
              functionName: 'callVerifyOtpApi(){}',
              blockNumber: 2,
              printStatement:
                  'Response Status Code :\n' + response.statusCode.toString());
        }
      } on DioError catch (error) {
        PrintLog.printLog(
            fileName: 'Forgot Password Service File',
            functionName: 'callVerifyOtpApi(){}',
            blockNumber: 3,
            printStatement: error.message);
      }
    }

    void callVerifyOtpApiHandler() {
      var _otpText = _otpController.text;
      if (_otpText.isEmpty) {
        // Will Change later
        print('OTP textfield empty');
      } else {
        callVerifyOtpApi(data: {"otp": _otpText});
      }
    }

    return Column(
      children: [
        TextFormField(
          focusNode: FocusNode(),
          controller: _otpController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            label: Text('Enter OTP'),
            labelStyle: TextStyle(color: kPrimaryColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: Get.back,
                child: Text('Get back'),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, onPrimary: kSecondaryColor),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: callVerifyOtpApiHandler,
                child: Text('Verify OTP'),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, onPrimary: kSecondaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  var _newPasswordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  bool _passwordConfirmPasswordMatched = false;

  @override
  Widget build(BuildContext context) {

    void overridePasswordHandler() {
      var _newPasswordText = _newPasswordController.text;
      if (_newPasswordText.isEmpty) {
        // Will Change later
        print('New PasswordTextField empty');
      } else {
        if (_newPasswordController.text != _confirmPasswordController.text) {
          Get.defaultDialog(
              title: "Passwords don't match",
              middleText:
                  "New and confirm password fields should have same values");
        } else {
          var data = {"newPassword": _confirmPasswordController.text};
          ChangePasswordService.callOverridePasswordApi(data, context);
        }
      }
    }

    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            setState(() {
              if (value == _confirmPasswordController.text) {
                _passwordConfirmPasswordMatched = true;
              } else {
                _passwordConfirmPasswordMatched = false;
              }
            });
          },
          focusNode: FocusNode(),
          controller: _newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            label: Text('New password'),
            labelStyle: TextStyle(color: kPrimaryColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          onChanged: (value) {
            setState(() {
              if (value == _newPasswordController.text) {
                _passwordConfirmPasswordMatched = true;
              } else {
                _passwordConfirmPasswordMatched = false;
              }
            });
          },
          focusNode: FocusNode(),
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            label: Text('Confirm password'),
            labelStyle: TextStyle(color: kPrimaryColor),
            // errorText: _passwordConfirmPasswordMatched.toString(),
            errorText: "",
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _confirmPasswordController.text.isNotEmpty ?
                _passwordConfirmPasswordMatched
                    ? Colors.green
                    : Colors.red
                    : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: Get.back,
                child: Text('Get back'),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, onPrimary: kSecondaryColor),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: overridePasswordHandler,
                child: Text('Change password'),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, onPrimary: kSecondaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
