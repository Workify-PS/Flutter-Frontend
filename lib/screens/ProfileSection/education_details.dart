import 'package:flutter/material.dart';
// import 'package:workify/utils/sizes.dart';

// var screenWidth, screenHeight;

class EducationDetails extends StatelessWidget {
  const EducationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
      ),
    );
  }
}