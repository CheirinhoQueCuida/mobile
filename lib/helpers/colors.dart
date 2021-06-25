import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF440D3B);
  static const Color primaryColorLight = Color(0xFFFFD6F8);
  static const Color secondaryColor = Color(0xFF929119);
  static const Color accentColor = Color(0xFFE7686A);
  static const Color background = Color(0xFFF0F0F0);
  static const Color backgroundLightColor = Color(0xFFEBE4D2);

  static ThemeData mainTheme = ThemeData(
    primarySwatch: AppColors.customMaterialColor(AppColors.primaryColor.value),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
        color: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.primaryColor.withOpacity(0.6),
          statusBarColor: AppColors.primaryColor.withOpacity(0.6),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: AppColors.secondaryColor,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: primaryColor, fontSize: 24, fontWeight: FontWeight.w300),
        textTheme: TextTheme(
            headline6: TextStyle(
                color: primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w300))),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(),
      bodyText2: GoogleFonts.montserrat(),
      button: GoogleFonts.montserrat(),
      caption: GoogleFonts.montserrat(),
      headline1: GoogleFonts.montserrat(),
      headline2: GoogleFonts.montserrat(),
      headline3: GoogleFonts.montserrat(),
      headline4: GoogleFonts.montserrat(),
      headline5: GoogleFonts.montserrat(),
      headline6: GoogleFonts.montserrat(),
      overline: GoogleFonts.montserrat(),
      subtitle1: GoogleFonts.montserrat(),
      subtitle2: GoogleFonts.montserrat(),
    ),
  );

  static MaterialColor customMaterialColor(int hex) {
    Color color = Color(hex);
    int r = color.red;
    int g = color.green;
    int b = color.blue;
    return MaterialColor(hex, {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    });
  }
}
