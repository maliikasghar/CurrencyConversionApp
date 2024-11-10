import 'package:flutter/material.dart';
import 'package:currencyconversionapp/components/themecolor_widget.dart';

class TextComponents {
  static const TextStyle titleText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ThemeColors.textColor,
  );

  static const TextStyle pageTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subtitleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ThemeColors.textColor,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: ThemeColors.textColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle footerText = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
}
