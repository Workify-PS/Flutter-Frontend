import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/screens/SplashScreen/splash_widget.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            // child: CircularProgressIndicator(
            //   color: kPrimaryColor,
            // ),
          ),
          SizedBox(
              height: 100,
              child: Image.network("assets/images/loading_nobg.gif")),
          Text('Loading...'),
        ],
      ),
    ));
  }
}
