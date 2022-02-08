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
            TextStyle(color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
