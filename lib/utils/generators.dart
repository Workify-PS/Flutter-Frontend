import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:workify/components/top_bar.dart';
import 'package:workify/utils/constants.dart';

generateTopBar({
  required String title,
  Widget? widget,
  Widget? extendedWidget,
}) {
  final height = extendedWidget == null ? bannerHeight : bannerHeight * 1.5;
  return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: TopBar(
          title: translator.translate(title),
          customTopBar: widget,
          extendedWidget: extendedWidget,
          height: height));
}
