import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/utilities/constants/app_colors.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: AppColors.lightPrimaryColor,
    accentColor: AppColors.lightAccentColor,
    scaffoldBackgroundColor: AppColors.lightAccentColor,
    bannerTheme: MaterialBannerThemeData(
      backgroundColor: AppColors.topHalfBackgroundColorWidgetInLoginAndHome,
    ),
    backgroundColor: AppColors.backgroundCardsColor,
    iconTheme: IconThemeData(
      color: AppColors.lightAccentColor,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
    ),
    canvasColor: Colors.transparent,
    primaryColorLight: AppColors.mainTextsColor,
    cursorColor: AppColors.lightPrimaryColor,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  );
}
