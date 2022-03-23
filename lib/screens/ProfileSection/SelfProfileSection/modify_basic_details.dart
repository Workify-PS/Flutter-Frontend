// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:workify/components/button.dart';
import 'package:workify/controllers/modify_employee_profile_details_controller.dart';
import 'package:workify/screens/ProfileSection/ModifySelf_EmployeePosition_Employment/text_form_modify_profile_details.dart';
// import 'package:workify/exceptions/print_log.dart';
import 'package:workify/utils/sizes.dart';
import 'package:workify/controllers/profile_details_controller.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ModifyBasicDetails extends StatelessWidget {
  const ModifyBasicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulModifyBasicDetails();
  }
}

class StatefulModifyBasicDetails extends StatefulWidget {
  const StatefulModifyBasicDetails({Key? key}) : super(key: key);

  @override
  _StatefulModifyBasicDetails createState() => _StatefulModifyBasicDetails();
}

class _StatefulModifyBasicDetails extends State<StatefulModifyBasicDetails> {
  var _mobileController,
      _marriageStatusController,
      _marriageStatusSelectedValue,
      _cityController,
      _stateController,
      _countryController;

  var marriageStatus = 'Single';
  String code = '';
  var MobileNumber = [];

  void getBack() {
    Get.offNamed('/home');
  }

  void callOnSubmitBasicDetails() {
    ModifyEmployeeProfileDetailsController.onSubmitBasicDetails(
        mobile: code + ' ' +
          _mobileController.text == 'Need to update.' ? -1 : _mobileController.text,
        marriageStatus: _marriageStatusSelectedValue,
        city: _cityController.text == 'Need to update.' ? -1 : _cityController.text,
        state: _stateController.text == 'Need to update.' ? -1 : _stateController.text,
        country: _countryController.text == 'Need to update.' ? -1 : _countryController.text
    );
  }

  final profileDetailsController = Get.find<ProfileDetailsController>();

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    var textFormList = [
      'Mobile Number',
      'Marriage Status',
      'City',
      'State',
      'Country'
    ];

    void onInitCountryCode(CountryCode countryCode) {
      code = countryCode.toString();
    }

    void onChangeCountryCode(CountryCode countryCode) {
      code = countryCode.toString();
    }

    String validateMobile(String value) {
      if (value.contains(RegExp(r'[A-Za-z]'))) {
        return 'Should Contain only number';
      }
      return 'Correct !';
    }

    String _tempMobileNumber =
        profileDetailsController.employeeInfoModelDetails?.mobile ??
            'Mobile Number Not Found';
    MobileNumber = _tempMobileNumber.split(' ');
    if (MobileNumber.isEmpty) {
      _mobileController = TextEditingController(text: 'NA');
    } else if (MobileNumber.length == 1) {
      _mobileController = TextEditingController(text: MobileNumber[0]);
    } else {
      _mobileController = TextEditingController(text: MobileNumber[1]);
    }

    _marriageStatusController = TextEditingController(
        text:
            profileDetailsController.employeeInfoModelDetails?.marriageStatus ??
                'Marriage Status Not Found');

    _cityController = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.city ??
          'City Not Found',
    );

    _stateController = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.state ??
          'State Not Found',
    );

    _countryController = TextEditingController(
      text: profileDetailsController.employeeInfoModelDetails?.country ??
          'Country Not Found',
    );

    var textFormList_2_Controllers = {
      'Mobile Number': _mobileController,
      'Marriage Status': _marriageStatusController,
      'City': _cityController,
      'State': _stateController,
      'Country': _countryController
    };

    return Padding(
      padding: portrait == false
          ? const EdgeInsets.symmetric(horizontal: 300)
          : const EdgeInsets.all(8),
      child: Container(
        color: Colors.transparent,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  if (index == 0) {
                    return Row(
                      children: [
                        Expanded(
                          flex: portrait ? 3 : 2,
                          child: CountryCodePicker(
                            dialogBackgroundColor: Colors.transparent,
                            showDropDownButton: true,
                            initialSelection: MobileNumber[0],
                            showFlag: false,
                            onInit: (value) {
                              onInitCountryCode(value!);
                            },
                            onChanged: onChangeCountryCode,
                            favorite: ['+91', 'IN'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: portrait ? 6 : 7,
                          child: TextFormModifyDetails(
                            myFocusNode: FocusNode(),
                            keyBoardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            enabled: true,
                            text: textFormList[index],
                            controller:
                                textFormList_2_Controllers[textFormList[index]],
                          ),
                        ),
                      ],
                    );
                  } else if (index == 1) {
                    return Row(
                      children: [
                        Expanded(
                          flex: portrait ? 3 : 2,
                          child: DropdownButton(
                              value: marriageStatus,
                              items: ['Single', 'Married'].map((item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                              onChanged: (selectedItem) {
                                setState(() {
                                  marriageStatus = selectedItem.toString();
                                  _marriageStatusSelectedValue = marriageStatus;
                                  print(marriageStatus);
                                  print(_marriageStatusController.text);
                                  print(_marriageStatusSelectedValue);
                                });
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: portrait ? 6 : 7,
                          child: TextFormModifyDetails(
                            myFocusNode: FocusNode(),
                            keyBoardType: TextInputType.text,
                            enabled: false,
                            text: textFormList[index],
                            controller:
                                textFormList_2_Controllers[textFormList[index]],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return TextFormModifyDetails(
                      myFocusNode: FocusNode(),
                      keyBoardType: TextInputType.text,
                      enabled: true,
                      text: textFormList[index],
                      controller:
                          textFormList_2_Controllers[textFormList[index]],
                    );
                  }
                }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    buttonTextWidget: Text('Get Back'),
                    onPressed: getBack,
                  ),
                  PrimaryButton(
                    buttonTextWidget: Text('Submit'),
                    onPressed: callOnSubmitBasicDetails,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
