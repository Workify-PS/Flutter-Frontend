import 'package:flutter/material.dart';
import 'package:workify/components/button.dart';
import 'package:workify/components/text_form.dart';
import 'package:workify/exceptions/print_log.dart';
import 'package:workify/utils/sizes.dart';

double screenWidth = 0, screenHeight = 0;
bool portrait = false;

class ModifyBasicDetails extends StatelessWidget {
 const ModifyBasicDetails({Key? key}) : super(key: key);

  void cancelClicked (){
    PrintLog.printLog(
      fileName: 'modify_basic_details',
      functionName: 'Cancel : onPressed',
      blockNumber: 1,
      printStatement: 'Cancel Clicked',
    );
  }
  void submitClicked (){
    PrintLog.printLog(
      fileName: 'modify_basic_details',
      functionName: 'Submit : onPressed',
      blockNumber: 1,
      printStatement: 'Submit Clicked',
    );
  }

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    screenWidth = device.size.width;
    screenHeight = device.size.height;

    portrait = screenWidth < 1000;

    var textFormList = [
      'Mobile Number',
      'Date of Birth',
      'City',
      'State',
      'Country'
    ];

    return Padding(
      padding: portrait == false
          ? const EdgeInsets.symmetric(horizontal: 300)
          : const EdgeInsets.all(8),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5,(index) => TextForm(
                    myFocusNode: FocusNode(),
                    text: textFormList[index],
                  )
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    buttonTextWidget: Text('Cancel'),
                    onPressed: cancelClicked,
                  ),
                  Button(
                    buttonTextWidget: Text('Submit'),
                    onPressed: submitClicked,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
