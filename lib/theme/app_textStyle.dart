import 'dart:ui';

import 'package:demo_app/theme/app_colors.dart';
import 'package:flutter/src/painting/text_style.dart';

import 'package:google_fonts/google_fonts.dart';



class AppTextStyle {

  static TextStyle regular10() {
    return TextStyle(
      fontFamily: 'bit_count_prop_single',
      color: AppColors.darkText,
      fontSize: 25,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle googleFont({Color color = AppColors.blackColor}) {
    return GoogleFonts.adamina(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  // 🌞 Light
  static const TextStyle lightHeadline = TextStyle(
    fontFamily: 'bit_count_prop_single',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.lightText,
  );

  static const TextStyle lightTitle = TextStyle(
    fontFamily: 'bit_count_prop_single',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.lightText,
  );

  static const TextStyle lightBody = TextStyle(
    fontFamily: 'bit_count_prop_single',
    fontSize: 14,
    color: AppColors.lightText,
  );

  // 🌙 Dark
  static const TextStyle darkHeadline = TextStyle(
    fontFamily: 'bit_count_prop_single',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  static const TextStyle darkTitle = TextStyle(
    fontFamily: 'bit_count_prop_single',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
  );

  static const TextStyle darkBody = TextStyle(
    fontFamily: 'bit_count_prop_single',
    fontSize: 14,
    color: AppColors.darkText,
  );

}