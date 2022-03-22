import 'package:flutter/material.dart';

class Yuo extends StatelessWidget {
  const Yuo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsivescreen(
      child: Card(
        child: Text("yuo"),
      ),
    );
  }
}

class Responsivescreen extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget child;

  const Responsivescreen(
      {Key? key, this.mobile, this.tablet, required this.child})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return child;
      } else if (constraints.maxWidth >= 650) {
        return tablet ?? child;
      } else {
        return mobile ?? child;
      }
    });
  }
}
