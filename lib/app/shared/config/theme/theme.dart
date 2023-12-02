import 'package:flutter/material.dart';

extension UIThemeExtension on BuildContext {
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}

extension TextStyleExtension on TextStyle {
  TextStyle? get ultra => copyWith(fontFamily: 'MonumentExtended');

  TextStyle? get wh => copyWith(color: Colors.white);
}
