// import 'package:flutter/material.dart';

// class GetDate extends StatefulWidget {
//   const GetDate({Key? key}) : super(key: key);
//   @override
//   State<GetDate> createState() => _GetDateState();
// }

// class _GetDateState extends State<GetDate> {
//   String finalDate = '';
//   getCurrentDate() {
//     var date = new DateTime.now().toString();
//     var dateParse = DateTime.parse(date);
//     var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
//     setState(() {
//       finalDate = formattedDate.toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text(
//         finalDate,
//         style: TextStyle(fontSize: 20),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }
