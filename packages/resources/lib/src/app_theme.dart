import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resources/resources.dart';

class AppTheme {
  AppTheme._();

  static TextTheme lighTextTheme = TextTheme(
    headline1: GoogleFonts.openSans(
      fontSize: AppDimens.h1,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: AppPalette.darkBlue,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: AppDimens.h2,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: AppPalette.darkBlue,
    ),
    // Sign In
    headline3: GoogleFonts.openSans(
      fontSize: AppDimens.h3,
      fontWeight: FontWeight.w600,
      color: AppPalette.darkBlue,
    ),
    // Onboarding
    headline4: GoogleFonts.openSans(
      fontSize: AppDimens.h4,
      fontWeight: FontWeight.w700,
      color: AppPalette.darkBlue,
    ),
    // Detail
    headline5: GoogleFonts.openSans(
      fontSize: AppDimens.h5,
      fontWeight: FontWeight.w800,
      color: AppPalette.darkBlue,
    ),
    // Detail
    headline6: GoogleFonts.openSans(
      fontSize: AppDimens.h6,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      color: AppPalette.darkBlue,
    ),
    // Home: Header, card
    subtitle1: GoogleFonts.openSans(
      fontSize: AppDimens.subtitle1,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      color: AppPalette.darkBlue,
    ),
    // Header
    subtitle2: GoogleFonts.openSans(
      fontSize: AppDimens.subtitle2,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: AppPalette.darkBlue.withOpacity(0.3),
    ),
    // Home: textfield
    bodyText1: GoogleFonts.poppins(
      fontSize: AppDimens.body1,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: AppPalette.darkBlue,
    ),
    // Detail
    bodyText2: GoogleFonts.poppins(
      fontSize: AppDimens.body2,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: AppPalette.darkBlue.withOpacity(0.7),
    ),
    // Detail
    button: GoogleFonts.poppins(
      fontSize: AppDimens.button,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.25,
      color: AppPalette.whiteColor,
    ),
    // Detail
    caption: GoogleFonts.poppins(
      fontSize: AppDimens.caption,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.4,
      color: AppPalette.darkBlue,
    ),
    overline: GoogleFonts.poppins(
      fontSize: AppDimens.overline,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: AppPalette.darkBlue,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 93,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: Colors.white,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 58,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: Colors.white,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 46,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 33,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.white,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 23,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.white,
    ),
    button: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: Colors.white,
    ),
    caption: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Colors.white,
    ),
    overline: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        color: AppPalette.darkBlue,
        elevation: 0,
      ),
      textTheme: lighTextTheme,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppPalette.darkBlue,
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: AppPalette.greyColor2,
        filled: true,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppPalette.whiteColor,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10),
          elevation: 4,
          backgroundColor: AppPalette.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: darkTextTheme,
    );
  }
}
