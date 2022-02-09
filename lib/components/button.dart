import 'package:flutter/material.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

// Changed buttonTextString to buttonTextWidget for customized text styling

class Button extends StatelessWidget {
  final Widget buttonTextWidget;
  const Button({
    Key? key, 
    required this.buttonTextWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width * 0.25;
    return ElevatedButton(
      onPressed: () {},
      child: buttonTextWidget,
    ).makeRounded(MyTheme().isDark(context));
  }
}
