import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

class Button extends StatelessWidget {
  final String buttontext;
  final bool isActive;
  const Button({Key? key, required this.buttontext, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle? buttonStyle;
    if (isActive) {
      buttonStyle = ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          onPrimary: kTextDarkColor,
          elevation: 6,
          shadowColor: kTopShadowColorDark,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ));
    }
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        buttontext,
        textAlign: TextAlign.center,
      ),
      style: buttonStyle,
    ).makeRounded(MyTheme().isDark(context));
  }
}
