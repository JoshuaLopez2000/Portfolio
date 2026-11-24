import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Modern Dark Studio palette
  static const Color background = Color(0xFF0B0F17);
  static const Color surface = Color(0xFF131A26);
  static const Color surfaceElevated = Color(0xFF1B2436);
  static const Color border = Color(0xFF243044);
  static const Color primary = Color(0xFF38BDF8); // Clean Sky Accent
  static const Color secondary = Color(0xFF818CF8); // Subtle Indigo Accent
  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color codeComment = Color(0xFF94A3B8);

  static TextStyle mono({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w500,
    Color color = textSecondary,
    double? letterSpacing,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static ThemeData get themeData {
    final baseText = GoogleFonts.plusJakartaSansTextTheme(
      ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        onPrimary: background,
        onSecondary: textPrimary,
        onSurface: textPrimary,
        outline: border,
      ),
      textTheme: baseText.copyWith(
        displayLarge: GoogleFonts.plusJakartaSans(
          color: textPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.4,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          color: textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.8,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          color: textPrimary,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          color: textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 19,
          letterSpacing: -0.2,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          color: textPrimary,
          fontSize: 16,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          color: textSecondary,
          fontSize: 14,
          height: 1.55,
        ),
        labelLarge: GoogleFonts.plusJakartaSans(
          color: textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      iconTheme: const IconThemeData(color: textPrimary),
    );
  }
}
