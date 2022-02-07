import 'package:flutter/material.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

class Button extends StatelessWidget {
  final String buttontext;

  const Button({Key? key, required this.buttontext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width * 0.25;
    return 
    ElevatedButton(
      onPressed: () {},
      
      child: Text(
        buttontext,
        textAlign: TextAlign.center,
      ),
    ).makeRounded(MyTheme().isDark(context));
  }
}
