import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

class AppThemeData {
  static const _primaryColor = Color(0xFF6750A4);
  static const _secondaryColor = Color(0xFF625B71);

  // Light Theme Colors
  static const _lightBackgroundColor = Color(0xFFFFFBFE);
  static const _lightSurfaceColor = Color(0xFFFFFBFE);
  static const _lightErrorColor = Color(0xFFB3261E);
  static const _lightTextPrimaryColor = Color(0xFF1C1B1F);
  static const _lightTextSecondaryColor = Color(0xFF49454F);
  static const _lightDividerColor = Color(0xFFCAC4D0);

  // Dark Theme Colors
  static const _darkBackgroundColor = Color(0xFF1C1B1F);
  static const _darkSurfaceColor = Color(0xFF2B2930);
  static const _darkErrorColor = Color(0xFFF2B8B5);
  static const _darkTextPrimaryColor = Color(0xFFE6E1E5);
  static const _darkTextSecondaryColor = Color(0xFFCAC4D0);
  static const _darkDividerColor = Color(0xFF49454F);

  // Spacing
  static const _spacingXXS = 2.0;
  static const _spacingXS = 4.0;
  static const _spacingS = 8.0;
  static const _spacingM = 16.0;
  static const _spacingL = 24.0;
  static const _spacingXL = 32.0;
  static const _spacingXXL = 40.0;

  // Border Radius
  static const _radiusXS = 4.0;
  static const _radiusS = 8.0;
  static const _radiusM = 12.0;
  static const _radiusL = 16.0;
  static const _radiusXL = 24.0;

  static AppTheme get light {
    return AppTheme(
      primaryColor: _primaryColor,
      secondaryColor: _secondaryColor,
      backgroundColor: _lightBackgroundColor,
      surfaceColor: _lightSurfaceColor,
      errorColor: _lightErrorColor,
      textPrimaryColor: _lightTextPrimaryColor,
      textSecondaryColor: _lightTextSecondaryColor,
      dividerColor: _lightDividerColor,
      headlineLarge: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: _lightTextPrimaryColor,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: _lightTextPrimaryColor,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: _lightTextPrimaryColor,
      ),
      titleLarge: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: _lightTextPrimaryColor,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: _lightTextPrimaryColor,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: _lightTextPrimaryColor,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: _lightTextPrimaryColor,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: _lightTextPrimaryColor,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: _lightTextSecondaryColor,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: _lightTextPrimaryColor,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: _lightTextPrimaryColor,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: _lightTextSecondaryColor,
      ),
      spacingXXS: _spacingXXS,
      spacingXS: _spacingXS,
      spacingS: _spacingS,
      spacingM: _spacingM,
      spacingL: _spacingL,
      spacingXL: _spacingXL,
      spacingXXL: _spacingXXL,
      radiusXS: _radiusXS,
      radiusS: _radiusS,
      radiusM: _radiusM,
      radiusL: _radiusL,
      radiusXL: _radiusXL,
    );
  }

  static AppTheme get dark {
    return AppTheme(
      primaryColor: _primaryColor,
      secondaryColor: _secondaryColor,
      backgroundColor: _darkBackgroundColor,
      surfaceColor: _darkSurfaceColor,
      errorColor: _darkErrorColor,
      textPrimaryColor: _darkTextPrimaryColor,
      textSecondaryColor: _darkTextSecondaryColor,
      dividerColor: _darkDividerColor,
      headlineLarge: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: _darkTextPrimaryColor,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: _darkTextPrimaryColor,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: _darkTextPrimaryColor,
      ),
      titleLarge: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: _darkTextPrimaryColor,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: _darkTextPrimaryColor,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: _darkTextPrimaryColor,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: _darkTextPrimaryColor,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: _darkTextPrimaryColor,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: _darkTextSecondaryColor,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: _darkTextPrimaryColor,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: _darkTextPrimaryColor,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: _darkTextSecondaryColor,
      ),
      spacingXXS: _spacingXXS,
      spacingXS: _spacingXS,
      spacingS: _spacingS,
      spacingM: _spacingM,
      spacingL: _spacingL,
      spacingXL: _spacingXL,
      spacingXXL: _spacingXXL,
      radiusXS: _radiusXS,
      radiusS: _radiusS,
      radiusM: _radiusM,
      radiusL: _radiusL,
      radiusXL: _radiusXL,
    );
  }
}
