import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workify/services/forgot_password_service.dart';
import 'package:workify/utils/constants.dart';

class VerifyOtpWidget extends StatefulWidget {
  VerifyOtpWidget({Key? key}) : super(key: key);

  @override
  State<VerifyOtpWidget> createState() => _VerifyOtpWidgetState();
}

class _VerifyOtpWidgetState extends State<VerifyOtpWidget> {
  final _otpController = TextEditingController();

  void callVerifyOtpApiHandler() {
    var _otpText = _otpController.text;

    if (_otpText.isEmpty) {
      // Will Change later
      print('OTP textfield empty');
    } else {
      ForgotPasswordService().callVerifyOtpApi(data: {"otp": _otpText});
    }
  }

  @override
  Widget build(BuildContext context) {
    print("reb");
    return Column(
      children: [
        TextField(
          controller: _otpController,
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
