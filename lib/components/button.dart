import 'package:flutter/material.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

// Changed buttonTextString to buttonTextWidget for customized text styling

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color? color;
  const Button({Key? key, required this.text, this.press, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press??() {},
      child: Text(text),
      
    ).makeRounded(MyTheme().isDark(context));
  }
}
