import 'package:flutter/material.dart';
// import 'package:workify/utils/sizes.dart';

// var screenWidth, screenHeight;

class EmploymentDetails extends StatelessWidget {
  const EmploymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.shade100,
        ),
      ),
    );
  }
}
