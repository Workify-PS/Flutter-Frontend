import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/services/change_password_service.dart';
import 'package:workify/utils/constants.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  var _newPasswordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  bool _passwordConfirmPasswordMatched = false;
  int newPasswordValidateFlag = 0;
  var newPasswordValidateText = 'New password';

  @override
  Widget build(BuildContext context) {
    void validatePassword(String newPasswordText) {
      var newPasswordLength = newPasswordText.length;
      var upperCase = newPasswordText.contains(RegExp('[A-Z]'));
      var lowerCase = newPasswordText.contains(RegExp('[a-z]'));
      var digit = newPasswordText.contains(RegExp('[0-9]'));
      var specialChar =
          newPasswordText.contains(RegExp(r'[`~!@#$%^&*();:,<.>/?]'));

      // print(upperCase.toString() +
      //     ' ' +
      //     lowerCase.toString() +
      //     ' ' +
      //     digit.toString() +
      //     ' ' +
      //     specialChar.toString());

      if (newPasswordLength == 0) {
        setState(() {
          newPasswordValidateFlag = 0;
          newPasswordValidateText = 'New password';
        });
      } else if (newPasswordLength >= 8 &&
          lowerCase &&
          upperCase &&
          digit &&
          specialChar) {
        setState(() {
          newPasswordValidateFlag = 3;
          newPasswordValidateText = 'Strong Password';
        });
      } else if (newPasswordLength > 3 && (lowerCase || upperCase) && digit) {
        setState(() {
          newPasswordValidateFlag = 2;
          newPasswordValidateText = 'Weak Password';
        });
      } else if ((lowerCase || upperCase) && !digit) {
        setState(() {
          newPasswordValidateFlag = 1;
          newPasswordValidateText = 'Too weak Password';
        });
      }
    }

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
            validatePassword(value);
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
            suffixIcon: IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'For strong password',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password length must be atleast 8'),
                      Text('and must contain at least'),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1 lower case'),
                            Text('1 upper case'),
                            Text('1 digit'),
                            Text('1 special character'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.info_outline),
            ),
            label: Text(
              newPasswordValidateText,
              style: TextStyle(
                  color: newPasswordValidateFlag == 1
                      ? Colors.red
                      : newPasswordValidateFlag == 2
                          ? Colors.amber
                          : newPasswordValidateFlag == 3
                              ? Colors.green
                              : kPrimaryColor),
            ),
            labelStyle: TextStyle(color: kPrimaryColor),
            // focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: kPrimaryColor)),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8.0),
            //   borderSide: BorderSide(color: kPrimaryColor, width: 2),
            // ),
            errorText: "",
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: newPasswordValidateFlag == 1
                      ? Colors.red
                      : newPasswordValidateFlag == 2
                          ? Colors.amber
                          : newPasswordValidateFlag == 3
                              ? Colors.green
                              : Colors.grey),
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
                color: _confirmPasswordController.text.isNotEmpty
                    ? _passwordConfirmPasswordMatched
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
