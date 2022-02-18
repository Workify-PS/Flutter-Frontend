import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

class TextFormModifyProfileDetails extends StatelessWidget {
  final String text;
  final FocusNode myFocusNode;
  final controller;

  const TextFormModifyProfileDetails({
    Key? key,
    required this.myFocusNode,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: myFocusNode,
      cursorColor: kBottomShadowColor,
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.red),
        focusedBorder:
            OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red
              )
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
