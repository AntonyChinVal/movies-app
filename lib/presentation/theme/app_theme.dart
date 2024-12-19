import 'package:flutter/material.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color errorColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color dividerColor;

  // Typography
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  // Spacing
  final double spacingXXS;
  final double spacingXS;
  final double spacingS;
  final double spacingM;
  final double spacingL;
  final double spacingXL;
  final double spacingXXL;

  // Border Radius
  final double radiusXS;
  final double radiusS;
  final double radiusM;
  final double radiusL;
  final double radiusXL;

  const AppTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.errorColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.dividerColor,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.spacingXXS,
    required this.spacingXS,
    required this.spacingS,
    required this.spacingM,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXL,
    required this.radiusXS,
    required this.radiusS,
    required this.radiusM,
    required this.radiusL,
    required this.radiusXL,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? errorColor,
    Color? textPrimaryColor,
    Color? textSecondaryColor,
    Color? dividerColor,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    double? spacingXXS,
    double? spacingXS,
    double? spacingS,
    double? spacingM,
    double? spacingL,
    double? spacingXL,
    double? spacingXXL,
    double? radiusXS,
    double? radiusS,
    double? radiusM,
    double? radiusL,
    double? radiusXL,
  }) {
    return AppTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      errorColor: errorColor ?? this.errorColor,
      textPrimaryColor: textPrimaryColor ?? this.textPrimaryColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      dividerColor: dividerColor ?? this.dividerColor,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      spacingXXS: spacingXXS ?? this.spacingXXS,
      spacingXS: spacingXS ?? this.spacingXS,
      spacingS: spacingS ?? this.spacingS,
      spacingM: spacingM ?? this.spacingM,
      spacingL: spacingL ?? this.spacingL,
      spacingXL: spacingXL ?? this.spacingXL,
      spacingXXL: spacingXXL ?? this.spacingXXL,
      radiusXS: radiusXS ?? this.radiusXS,
      radiusS: radiusS ?? this.radiusS,
      radiusM: radiusM ?? this.radiusM,
      radiusL: radiusL ?? this.radiusL,
      radiusXL: radiusXL ?? this.radiusXL,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      textPrimaryColor:
          Color.lerp(textPrimaryColor, other.textPrimaryColor, t)!,
      textSecondaryColor:
          Color.lerp(textSecondaryColor, other.textSecondaryColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      spacingXXS: lerpDouble(spacingXXS, other.spacingXXS, t),
      spacingXS: lerpDouble(spacingXS, other.spacingXS, t),
      spacingS: lerpDouble(spacingS, other.spacingS, t),
      spacingM: lerpDouble(spacingM, other.spacingM, t),
      spacingL: lerpDouble(spacingL, other.spacingL, t),
      spacingXL: lerpDouble(spacingXL, other.spacingXL, t),
      spacingXXL: lerpDouble(spacingXXL, other.spacingXXL, t),
      radiusXS: lerpDouble(radiusXS, other.radiusXS, t),
      radiusS: lerpDouble(radiusS, other.radiusS, t),
      radiusM: lerpDouble(radiusM, other.radiusM, t),
      radiusL: lerpDouble(radiusL, other.radiusL, t),
      radiusXL: lerpDouble(radiusXL, other.radiusXL, t),
    );
  }

  static double lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
