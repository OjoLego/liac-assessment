import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'responsive_helper.dart';

class AppTextStyles {
  final BuildContext context;

  AppTextStyles(this.context);

  TextStyle get greeting => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 16),
        fontWeight: FontWeight.w500,
        color: AppColors.darkGray,
      );

  TextStyle get userName => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 16),
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      );

  TextStyle get heading => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 42),
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      );

  TextStyle get subheading => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 42),
        fontWeight: FontWeight.w500,
        color: AppColors.darkGray,
      );

  TextStyle get scoreNumber => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 36),
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      );

  TextStyle get scoreTotal => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 20),
        fontWeight: FontWeight.w500,
        color: AppColors.darkGray,
      );

  TextStyle get buttonText => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 14),
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );

  TextStyle get statTitle => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 14),
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      );

  TextStyle get statValue => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 24),
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      );

  TextStyle get statDenominator => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 16),
        fontWeight: FontWeight.normal,
        color: AppColors.darkGray,
      );

  TextStyle get chipText => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 14),
        fontWeight: FontWeight.w500,
      );

  TextStyle get statsLabel => TextStyle(
        fontSize: ResponsiveHelper.getAdaptiveFontSize(context, 13),
        fontWeight: FontWeight.w500,
        color: AppColors.darkGray,
      );
}
