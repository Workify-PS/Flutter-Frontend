import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

class TextForm extends StatelessWidget {
  final String text;
  final FocusNode myFocusNode;
  const TextForm({
    Key? key,
    required this.myFocusNode,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: myFocusNode,
      cursorColor: kBottomShadowColor,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: Colors.white),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
