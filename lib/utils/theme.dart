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
      textSelectionColor: kTextColor,
      secondaryHeaderColor: Colors.white.withOpacity(0.5),
      focusColor: kPrimaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: kScaffoldColor,
            //elevation: 5,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            onPrimary: kTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            )),
      ),
      appBarTheme: AppBarTheme(foregroundColor: kTextColor),
      primaryTextTheme: TextTheme(
        headline1:
            CupertinoThemeData().textTheme.navLargeTitleTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
        headline5:
            CupertinoThemeData().textTheme.navLargeTitleTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
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
          textSelectionColor: kTextDarkColor,
          secondaryHeaderColor: kBottomShadowColorDark.withOpacity(0.7),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: kScaffoldDarkColor,
                onPrimary: kTextDarkColor,
                elevation: 6,
                shadowColor: kTopShadowColorDark,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                )),
          ),
          appBarTheme: AppBarTheme(foregroundColor: kMenuColor),
          primaryTextTheme: TextTheme(
            headline1:
                CupertinoThemeData().textTheme.navLargeTitleTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: kTextDarkColor,
                    ),
                    headline5:
            CupertinoThemeData().textTheme.navLargeTitleTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kTextDarkColor,
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
