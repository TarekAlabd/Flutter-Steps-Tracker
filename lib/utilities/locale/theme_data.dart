import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/utilities/constants/app_colors.dart';

class MainTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
      backgroundColor: AppColors.kRedAccentColor,
      primaryColorDark: AppColors.kGreyColor,
      primaryColorLight: AppColors.kPrimaryColor,
      dividerTheme: DividerThemeData(
        color: AppColors.kGreyColor.withOpacity(0.4),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.kScaffoldBackgroundColor,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.kScaffoldBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kErrorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kErrorColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
      canvasColor: Colors.transparent,
      errorColor: AppColors.kErrorColor,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      primaryColor: AppColors.kScaffoldBackgroundColor,
      scaffoldBackgroundColor: AppColors.kBlackColor,
      backgroundColor: AppColors.kRedAccentColor,
      primaryColorLight: AppColors.kPrimaryColor,
      primaryColorDark: AppColors.kScaffoldBackgroundColor,
      dividerTheme: DividerThemeData(
        color: AppColors.kScaffoldBackgroundColor.withOpacity(0.4),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.kBlackColor,
      ),
      listTileTheme: const ListTileThemeData(
        textColor: AppColors.kScaffoldBackgroundColor,
      ),
      cardColor: Colors.grey,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.kScaffoldBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kErrorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kErrorColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
      canvasColor: Colors.transparent,
      errorColor: AppColors.kErrorColor,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}
