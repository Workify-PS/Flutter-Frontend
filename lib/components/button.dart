import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

// Changed buttonTextString to buttonTextWidget for customized text styling

class Button extends StatelessWidget {
  final Widget buttonTextWidget;
  final void Function() onPressed;
  final Color primaryColor;
  const Button(
      {Key? key,
      required this.buttonTextWidget,
      required this.onPressed,
      this.primaryColor = kPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: buttonTextWidget,
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
      ),
    ).neuromorphism(
      context,
      topShadowColor: Colors.white,
      bottomShadowColor: primaryColor.withOpacity(0.2),
    );
  }
}
