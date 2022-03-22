// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:workify/screens/AuthPage/AuthPageController.dart';
// import 'package:workify/services/forgot_password_service.dart';
// import 'package:workify/utils/constants.dart';
// // import 'package:workify/screens/AuthPage.dart';

// class ForgotPassword extends GetView<AuthPageController> {
//   ForgotPassword({Key? key,required this.emailController}) : super(key: key);
//   final TextEditingController emailController;
//   FocusNode emailFocus = FocusNode();
//   void callCallForgotPasswordApi() {
//     var data = {"offMail": emailController.text};
//     ForgotPasswordService.callForgotPasswordApi(data: data);
//   }

//   @override
//   Widget build(BuildContext context) {
    

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Forgot your Password',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lato(
//                   textStyle: const TextStyle(
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Text(
//                 'Please enter your Registered Email Address',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lato(
//                   textStyle: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(bottom: 10.0),
//                 child: TextFormField(
//                   focusNode: emailFocus,
//                   controller: emailController,
                  
//                   cursorColor: kBottomShadowColor,
//                   validator: (email) => GetUtils.isEmail(email!)
//                       ? null
//                       : "Enter a valid Email ID",
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: 'Email ID',
//                     labelStyle: TextStyle(
//                         color: Theme.of(context)
//                             .primaryTextTheme
//                             .headline1!
//                             .color),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(color: kPrimaryColor, width: 1.5)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide(color: Colors.black, width: 2),
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   InkWell(
//                     onTap: controller.backToLogin,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8.0, top: 4),
//                       child: Text(
//                         'Back to Login',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(color: Colors.blue, fontSize: 12),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         ElevatedButton(
//           onPressed: callCallForgotPasswordApi,
//           //onPressed: loginAction,
//           style: ElevatedButton.styleFrom(
//               primary: kPrimaryColor,
//               onPrimary: Colors.white,
//               elevation: 8,
//               shadowColor: Colors.grey.shade800,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               )),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 58),
//             child: Wrap(
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text(
//                   'Request OTP',
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
