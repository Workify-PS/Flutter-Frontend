import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workify/utils/constants.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData.from(
          colorScheme: ColorScheme.light(
            primary: kBgLightColor,
            secondary: Color(0xFFF5F6FC),

            background: Colors.grey.shade50,
            surface: Colors.white,
          ),
          textTheme: GoogleFonts.latoTextTheme()
          //.apply(bodyColor: Colors.black, displayColor: Colors.black),
          )
      .copyWith(
        
          scaffoldBackgroundColor: kBgLightColor,
          cardTheme: CardTheme(
            margin: EdgeInsets.all(8.0),
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ));

  static ThemeData darkTheme = ThemeData.from(
    colorScheme: ColorScheme.light(
        primary: Color(0xff1263cc),
        secondary: Color(0xff1263cc),
        onSurface: Colors.white,
        background: Colors.grey.shade900,
        surface: Colors.grey.shade700),
    textTheme: GoogleFonts.workSansTextTheme()
        .apply(bodyColor: Colors.white, displayColor: Colors.white),
  ).copyWith(
      cardTheme: CardTheme(
    margin: EdgeInsets.all(8.0),
    elevation: 10.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ));
}
