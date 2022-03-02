import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

class TextFormModifyDetails extends StatelessWidget {
  final String text;
  final FocusNode myFocusNode;
  final bool enabled;
  final keyBoardType;
  final controller;
  var inputFormatters;

  TextFormModifyDetails({
    Key? key,
    required this.myFocusNode,
    required this.enabled,
    required this.text,
    required this.keyBoardType,
    required this.controller,
    this.inputFormatters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: myFocusNode,
      keyboardType: keyBoardType,
      enabled: enabled,
      inputFormatters: inputFormatters,
      cursorColor: kBottomShadowColor,
      controller: controller,
      onTap: () {
        controller.selection = TextSelection(
            baseOffset: 0, extentOffset: controller.value.text.length);
      },
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
