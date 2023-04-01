import 'package:flutter/material.dart';
import 'package:login_app/utils/colors.dart';

class AppFonts {
  static TextStyle getAppFont({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static final w600black24 = AppFonts.getAppFont(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: TextColors.blackTextColor,
  );
  static final w500black16 = AppFonts.getAppFont(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: TextColors.blackTextColor,
  );
  static final w500white16 = AppFonts.getAppFont(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: TextColors.whiteTextColor,
  );
  static final w400white14 = AppFonts.getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: TextColors.whiteTextColor,
  );
  static final w400black14 = AppFonts.getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: TextColors.blackTextColor,
  );
}
