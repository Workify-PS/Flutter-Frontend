import 'package:flutter/material.dart';
import 'package:workify/components/text_form.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
              padding: const EdgeInsets.only(right: 1400),
              child: Text('ACCOUNT',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor))),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [Body()],
          ),
        ));
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  get icon => null;
  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0.1, 0, 0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.5,
                      ),
                      Text(
                        'Change Password:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          // color: kTitleTextColor
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Choose a unique Password to protect your Account',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        width: 238,
                        child: TextForm(
                          myFocusNode: myFocusNode1,
                          text: 'Current Password',
                        ),
                      ),
                      SizedBox(height: 6.2),
                      SizedBox(
                        height: 40,
                        width: 238,
                        child: TextForm(
                          myFocusNode: myFocusNode2,
                          text: 'New Password',
                        ),
                      ),
                      SizedBox(height: 6.2),
                      SizedBox(
                        height: 40,
                        width: 238,
                        child: TextForm(
                          myFocusNode: myFocusNode3,
                          text: 'Confirm Password',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 41,
                        ),
                        Text(
                          'Password ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            // color: kTitleTextColor
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          '- must bew atleast 6 characters long,',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '- must contain lower case alphabets(a-z),',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '- can contain upper case alphabets(A-Z),',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "- must contain special characters(-/@#!*\$%^&,'_+={}[]).",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              onPrimary: Colors.white,
                              elevation: 8,
                              shadowColor: Colors.grey.shade800,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                          icon: Icon(Icons.save),
                          label: Text(
                            'Save',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              onPrimary: Colors.white,
                              elevation: 8,
                              shadowColor: Colors.grey.shade800,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                          icon: Icon(Icons.delete_outline_sharp),
                          label: Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
