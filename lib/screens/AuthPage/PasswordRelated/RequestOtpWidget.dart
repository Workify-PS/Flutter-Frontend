import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/services/forgot_password_service.dart';
import 'package:workify/utils/constants.dart';

class RequestOtpWidget extends StatelessWidget {
  RequestOtpWidget({Key? key}) : super(key: key);
  final _emailController = TextEditingController(
    // text: "ajaygond.rlb@gmail.com"
    );

  void callCallForgotPasswordApi() {
      var data = {"offMail": _emailController.text};
      ForgotPasswordService.callForgotPasswordApi(data : data);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              label: Text('Enter Gmail Id'),
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
                  onPressed: callCallForgotPasswordApi,
                  child: Text('Request OTP'),
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor, onPrimary: kSecondaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
