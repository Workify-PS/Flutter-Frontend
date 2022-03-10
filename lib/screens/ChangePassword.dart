// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workify/routes/router.dart';
// import 'package:workify/screens/HomePage/HomePageController.dart';
// // import 'package:workify/screens/ProfileSection/SelfProfileSection/ProfilePage.dart';
// import 'package:workify/services/change_password_service.dart';
// import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/sizes.dart';

// class ChangePassword extends StatefulWidget {
//   const ChangePassword({Key? key}) : super(key: key);

//   @override
//   _ChangePasswordState createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {

//   @override
//   Widget build(BuildContext context) {
//     return Text('Hi');
//   }
// }

// class ChangePassword1 extends StatelessWidget {
//   const ChangePassword1({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     DeviceSize device = DeviceSize();
//     device.size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           title: Padding(
//               padding: const EdgeInsets.only(right: 1400),
//               child: Text('ACCOUNT',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: kSecondaryColor))),
//           backgroundColor: kPrimaryColor,
//         ),
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [Body()],
//           ),
//         ));
//   }
// }

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   get icon => null;

//   final _currentPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   bool _passwordConfirmPasswordMatched = false;

//   @override
//   Widget build(BuildContext context) {
//     void saveNewPassword() {
//       if (_newPasswordController.text != _confirmPasswordController.text) {
//         Get.defaultDialog(
//             title: "Passwords don't match",
//             middleText:
//                 "New and confirm password fields should have same values");
//       } else {
//         var data = {
//           "oldPassword": _currentPasswordController.text,
//           "newPassword": _confirmPasswordController.text
//         };
//         ChangePasswordService.callChangePasswordApi(data, context);
//       }
//     }

//     void getBack() {
//       Get.find<HomePageController>().gotoPage(Routes.home, context);
//     }

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 0.1, 0, 0),
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   alignment: Alignment.topLeft,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 0.5,
//                       ),
//                       Text(
//                         'Change Password:',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           // color: kTitleTextColor
//                         ),
//                       ),
//                       // SizedBox(
//                       //   height: 14,
//                       // ),
//                       // Text(
//                       //   'Choose a unique Password to protect your Account',
//                       //   style: TextStyle(
//                       //       fontSize: 18, fontWeight: FontWeight.normal),
//                       // ),
//                       SizedBox(height: 10),
//                       SizedBox(
//                         height: 40,
//                         width: 238,
//                         child: TextFormField(
//                           obscureText: true,
//                           focusNode: FocusNode(),
//                           controller: _currentPasswordController,
//                           decoration: InputDecoration(
//                             label: Text('Current Password'),
//                             labelStyle: TextStyle(color: kPrimaryColor),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: kPrimaryColor)),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                               borderSide:
//                                   BorderSide(color: kPrimaryColor, width: 2),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 6.2),
//                       SizedBox(
//                         height: 40,
//                         width: 238,
//                         child: TextFormField(
//                           onChanged: (value) {
//                             setState(() {
//                               if (value == _confirmPasswordController.text) {
//                                 _passwordConfirmPasswordMatched = true;
//                               } else {
//                                 _passwordConfirmPasswordMatched = false;
//                               }
//                             });
//                           },
//                           obscureText: true,
//                           focusNode: FocusNode(),
//                           controller: _newPasswordController,
//                           decoration: InputDecoration(
//                             label: Text('New Password'),
//                             labelStyle: TextStyle(color: kPrimaryColor),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: kPrimaryColor)),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                               borderSide:
//                                   BorderSide(color: kPrimaryColor, width: 2),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 6.2),
//                       SizedBox(
//                         height: 62,
//                         width: 238,
//                         child: TextFormField(
//                           onChanged: (value) {
//                             setState(() {
//                               if (value == _newPasswordController.text) {
//                                 _passwordConfirmPasswordMatched = true;
//                               } else {
//                                 _passwordConfirmPasswordMatched = false;
//                               }
//                             });
//                           },
//                           focusNode: FocusNode(),
//                           controller: _confirmPasswordController,
//                           decoration: InputDecoration(
//                             label: Text('Confirm New Password'),
//                             labelStyle: TextStyle(color: kPrimaryColor),
//                             // errorText: passConfirmPassMatched.toString(),
//                             errorText: "",
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color:
//                                     _confirmPasswordController.text.isNotEmpty
//                                         ? _passwordConfirmPasswordMatched
//                                             ? Colors.green
//                                             : Colors.red
//                                         : Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: kPrimaryColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           )),
//           Expanded(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     alignment: Alignment.topLeft,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 41,
//                         ),
//                         Text(
//                           'Password ',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             // color: kTitleTextColor
//                           ),
//                         ),
//                         SizedBox(
//                           height: 14,
//                         ),
//                         Text(
//                           '- must bew atleast 6 characters long,',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.normal),
//                         ),
//                         Text(
//                           '- must contain lower case alphabets(a-z),',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.normal),
//                         ),
//                         Text(
//                           '- can contain upper case alphabets(A-Z),',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.normal),
//                         ),
//                         Text(
//                           "- must contain special characters(-/@#!*\$%^&,'_+={}[]).",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.normal),
//                         ),
//                         SizedBox(
//                           height: 18,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             ElevatedButton.icon(
//                               onPressed: saveNewPassword,
//                               style: ElevatedButton.styleFrom(
//                                   primary: kPrimaryColor,
//                                   onPrimary: kSecondaryColor,
//                                   elevation: 8,
//                                   shadowColor: Colors.grey.shade800,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8.0),
//                                   )),
//                               icon: Icon(Icons.save),
//                               label: Text(
//                                 'Save',
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             ElevatedButton(
//                               onPressed: getBack,
//                               child: Text('Get Back'),
//                               style: ElevatedButton.styleFrom(
//                                   primary: kPrimaryColor,
//                                   onPrimary: kSecondaryColor),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
