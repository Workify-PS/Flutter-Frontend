import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workify/utils/constants.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData.from(
    colorScheme: ColorScheme.light(
      primary: kMenuColor,
      secondary: kTextColor,
      background: Colors.grey.shade50,
      surface: Colors.white,
    ),
    textTheme: GoogleFonts.latoTextTheme().apply(bodyColor: kTextColor),
  ).copyWith(
      appBarTheme: AppBarTheme(foregroundColor: kTextColor),
      primaryTextTheme: TextTheme(
        headline1:
            CupertinoThemeData().textTheme.navLargeTitleTextStyle.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: kTextColor,
                ),
      ),
      scaffoldBackgroundColor: kScaffoldColor,
      shadowColor: Colors.white54,
      cardTheme: CardTheme(
        margin: EdgeInsets.all(8.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ));

  static ThemeData darkTheme = ThemeData.from(
          colorScheme: ColorScheme.light(
              primary: kMenuDarkColor,
              secondary: kTextDarkColor,
              onSurface: Colors.white,
              // brightness: Brightness.dark,

              background: Colors.grey.shade900,
              surface: Colors.grey.shade700),
          textTheme:
              GoogleFonts.latoTextTheme().apply(bodyColor: kTextDarkColor))
      .copyWith(
          appBarTheme: AppBarTheme(foregroundColor: kMenuColor),
          primaryTextTheme: TextTheme(
            headline1:
                CupertinoThemeData().textTheme.navLargeTitleTextStyle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: kMenuColor,
                    ),
          ),
          scaffoldBackgroundColor: kScaffoldDarkColor,
          iconTheme: IconThemeData(color: kTextDarkColor),
          shadowColor: Color(0xff262C37),
          cardTheme: CardTheme(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ));

  bool isDark(context) => Theme.of(context).primaryColor == kMenuDarkColor;
}
