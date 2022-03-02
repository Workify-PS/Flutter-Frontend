import 'package:flutter/material.dart';
import 'package:workify/components/top_bar.dart';
import 'package:workify/utils/constants.dart';

generateTopBar(
    { required String title,
    Widget? widget,
    }) {
  return PreferredSize(
      preferredSize: Size.fromHeight(bannerHeight),
      child: TopBar(
        title: title,
        customTopBar: widget,
        
      ));
}
