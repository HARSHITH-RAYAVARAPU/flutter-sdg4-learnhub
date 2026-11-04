import 'package:flutter/material.dart';

/// App theme configuration adhering to modern Material 3 design and SDG 4 brand identity.
class AppTheme {
  // Official SDG 4 Quality Education Brand Color
  static const Color sdgRed = Color(0xFFC5192D);
  static const Color sdgRedLight = Color(0xFFFFEBEE);

  // Badge Specific Palette (for Stack & Positioned Badges)
  static const Color badgeNewBg = Color(0xFF1E88E5); // Vibrant Azure Blue
  static const Color badgeFreeBg = Color(0xFF2E7D32); // Emerald Green
  static const Color badgePremiumBg = Color(0xFF6A1B9A); // Deep Purple
  static const Color starAmber = Color(0xFFFFA000); // Warm Star Amber

  // Background and Surface
  static const Color bgLight = Color(0xFFF8F9FA);
  static const Color surfaceCard = Colors.white;
  static const Color textPrimary = Color(0xFF1A1D20);
  static const Color textSecondary = Color(0xFF6C757D);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: sdgRed,
        primary: sdgRed,
        secondary: const Color(0xFF00796B),
        surface: surfaceCard,
        background: bgLight,
      ),
      scaffoldBackgroundColor: bgLight,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
      cardTheme: CardTheme(
        color: surfaceCard,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: sdgRed,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
