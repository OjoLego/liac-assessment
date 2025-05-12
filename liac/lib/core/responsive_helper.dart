import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsetsGeometry getPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16.0);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24.0);
    } else {
      return const EdgeInsets.all(32.0);
    }
  }

  static double getAdaptiveFontSize(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    final factor = width / 375;
    return baseSize * (factor > 1.5 ? 1.5 : (factor < 0.8 ? 0.8 : factor));
  }

  static double getAdaptiveIconSize(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    final factor = width / 375;
    return baseSize * (factor > 1.5 ? 1.5 : (factor < 0.8 ? 0.8 : factor));
  }

  static double getAdaptiveSize(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    final factor = width / 375;
    return baseSize * (factor > 1.5 ? 1.5 : (factor < 0.8 ? 0.8 : factor));
  }
}
