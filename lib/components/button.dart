import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

// Changed buttonTextString to buttonTextWidget for customized text styling

class PrimaryButton extends StatelessWidget {
  final Widget buttonTextWidget;
  final void Function() onPressed;
  final Color? primaryColor;
  final Icon? icon;
  const PrimaryButton(
      {Key? key,
      required this.buttonTextWidget,
      required this.onPressed,
      this.icon,
      this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextButton.styleFrom(
      backgroundColor:
          primaryColor ?? Theme.of(context).scaffoldBackgroundColor,
      primary: primaryColor != null
          ? Colors.white
          : Theme.of(context).textSelectionColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
    );
    return icon == null
        ? TextButton(
                onPressed: onPressed, child: buttonTextWidget, style: style)
            .neuromorphism(
            context,
          )
        : TextButton.icon(
                icon: icon!,
                onPressed: onPressed,
                label: buttonTextWidget,
                style: style)
            .neuromorphism(
            context,
          );
  }
}
