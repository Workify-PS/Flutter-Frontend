import 'package:flutter/material.dart';
import 'package:workify/utils/theme.dart';

extension MakeRounded on Widget {
  makeRounded({
    double borderRadius = 10.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 15,
    Color? topShadowColor = Colors.white54,
    Color? bottomShadowColor = const Color(0x26234395),
  }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: [
            BoxShadow(
              offset: offset,
              blurRadius: blurRadius,
              color: bottomShadowColor ?? const Color(0x26234395),
            ),
            BoxShadow(
              offset: Offset(-offset.dx, -offset.dx),
              blurRadius: blurRadius,
              color: topShadowColor ?? Colors.white54,
            ),
          ]),
      child: this,
    );
  }
}
