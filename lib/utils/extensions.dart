import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';
// import 'package:workify/utils/theme.dart';

extension Neuromorphism on Widget {
  neuromorphism(
    BuildContext context, {
    double borderRadius = 10.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 10,
    Color topShadowColor = kTopShadowColor,
    Color bottomShadowColor = kBottomShadowColor,
  }) {
    bool isDark = MyTheme().isDark(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: [
            BoxShadow(
              offset: offset,
              blurRadius: blurRadius,
              color: isDark
                  ? kBottomShadowColorDark.withOpacity(0.6)
                  : bottomShadowColor,
            ),
            BoxShadow(
              offset: Offset(-offset.dx, -offset.dx),
              blurRadius: blurRadius,
              color: isDark
                  ? kTopShadowColorDark.withOpacity(0.4)
                  : topShadowColor,
            ),
          ]),
      child: this,
    );
  }
}
