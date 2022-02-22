import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

class TextFormModifyProfileDetails extends StatelessWidget {
  final String text;
  final FocusNode myFocusNode;
  final bool enabled;
  final controller;

  const TextFormModifyProfileDetails({
    Key? key,
    required this.myFocusNode,
    required this.enabled,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: myFocusNode,
      enabled: enabled,
      cursorColor: kBottomShadowColor,
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: kPrimaryColor),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
      ),
    );
  }
}
