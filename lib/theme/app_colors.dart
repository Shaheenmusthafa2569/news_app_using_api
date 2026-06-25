import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ═══════════════════════════════════════════════════════════
//  NEWS HUB — Modern Vibrant News App Color Theme
//  Fresh, energetic, and engaging for breaking news
// ═══════════════════════════════════════════════════════════

class NewsColors {
  NewsColors._();

  // ── Primary Colors (Modern & Bold) ──
  static const Color primaryDeep = Color(0xFF0F172A); // deep navy
  static const Color primaryMedium = Color(0xFF1E293B); // slate
  static const Color primaryLight = Color(0xFF334155); // light slate

  // ── Accent Colors (Vibrant & Energetic) ──
  static const Color accentRed = Color(0xFFEF4444); // vibrant red
  static const Color accentCoral = Color(0xFFFF6B6B); // coral pink
  static const Color accentGold = Color(0xFFFCD34D); // golden yellow
  static const Color accentEmerald = Color(0xFF10B981); // emerald green
  static const Color accentCyan = Color(0xFF06B6D4); // cyan blue

  // ── Text Colors ──
  static const Color textPrimary = Color(0xFF0F172A); // dark navy
  static const Color textSecondary = Color(0xFF475569); // slate
  static const Color textTertiary = Color(0xFF94A3B8); // light slate
  static const Color textOnDark = Color(0xFFFFFFFF); // white
  static const Color textOnDarkSub = Color(0xFFE2E8F0); // light gray

  // ── Background Colors (Light Mode) ──
  static const Color bgLight = Color(0xFFF8FAFC); // very light
  static const Color bgLightCard = Color(0xFFFFFFFF); // pure white
  static const Color bgLightSoft = Color(0xFFF1F5F9); // soft light

  // ── Background Colors (Dark Mode) ──
  static const Color bgDark = Color(0xFF0F172A); // deep navy
  static const Color bgDarkCard = Color(0xFF1E293B); // dark slate
  static const Color bgDarkElevated = Color(0xFF334155); // elevated slate

  // ── Borders & Dividers ──
  static const Color borderLight = Color(0xFFE2E8F0); // light border
  static const Color borderDark = Color(0xFF475569); // dark border
  static const Color dividerLight = Color(0xFFCBD5E1);
  static const Color dividerDark = Color(0xFF334155);

  // ── Status Colors ──
  static const Color success = Color(0xFF059669);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);
  static const Color info = Color(0xFF3B82F6);

  // ── Category Colors (Vibrant Set) ──
  static const Color catTechnology = Color(0xFF8B5CF6); // purple
  static const Color catBusiness = Color(0xFF3B82F6); // blue
  static const Color catSports = Color(0xFFEC4899); // pink
  static const Color catHealth = Color(0xFF14B8A6); // teal
  static const Color catEntertainment = Color(0xFFF59E0B); // amber
  static const Color catScience = Color(0xFF06B6D4); // cyan
  static const Color catGeneral = Color(0xFF6B7280); // gray

  // ── Gradients (Modern) ──
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentCoral, accentGold],
  );

  static const LinearGradient trendingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [accentRed, accentCoral],
  );

  static const LinearGradient featureGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentCyan, accentEmerald],
  );

  // ── Opacity & Shadows ──
  static const Color shadowColor = Color(0x1A000000);
}

// ═══════════════════════════════════════════════════════════
//  THEME DATA
// ═══════════════════════════════════════════════════════════

class NewsTheme {
  NewsTheme._();

  // ── LIGHT THEME ──
  static ThemeData get light {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,

      // Primary
      primary: NewsColors.accentCyan,
      onPrimary: NewsColors.textOnDark,
      primaryContainer: Color(0xFFCFFAFE),
      onPrimaryContainer: NewsColors.accentCyan,

      // Secondary
      secondary: NewsColors.accentCoral,
      onSecondary: NewsColors.textOnDark,
      secondaryContainer: Color(0xFFFFE0E0),
      onSecondaryContainer: NewsColors.accentCoral,

      // Tertiary
      tertiary: NewsColors.accentEmerald,
      onTertiary: NewsColors.textOnDark,
      tertiaryContainer: Color(0xFFD1FAE5),
      onTertiaryContainer: NewsColors.accentEmerald,

      // Error
      error: NewsColors.error,
      onError: NewsColors.textOnDark,
      errorContainer: Color(0xFFFEE2E2),
      onErrorContainer: NewsColors.error,

      // Surface
      surface: NewsColors.bgLightCard,
      onSurface: NewsColors.textPrimary,
      surfaceContainerHighest: NewsColors.bgLightSoft,
      onSurfaceVariant: NewsColors.textSecondary,

      outline: NewsColors.borderLight,
      outlineVariant: NewsColors.dividerLight,
      shadow: NewsColors.shadowColor,
      scrim: Color(0x66000000),
      inverseSurface: NewsColors.primaryDeep,
      onInverseSurface: NewsColors.textOnDark,
      inversePrimary: NewsColors.accentCoral,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,

      scaffoldBackgroundColor: NewsColors.bgLight,

      // ── AppBar ──
      appBarTheme: const AppBarTheme(
        backgroundColor: NewsColors.bgLightCard,
        foregroundColor: NewsColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: NewsColors.bgLight,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: NewsColors.textPrimary,
          letterSpacing: -0.5,
        ),
        iconTheme: IconThemeData(color: NewsColors.accentCyan, size: 24),
      ),

      // ── Cards ──
      cardTheme: CardThemeData(
        color: NewsColors.bgLightCard,
        elevation: 0,
        shadowColor: NewsColors.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: NewsColors.borderLight, width: 0.5),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── ElevatedButton ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NewsColors.accentCyan,
          foregroundColor: NewsColors.textOnDark,
          disabledBackgroundColor: NewsColors.bgLightSoft,
          disabledForegroundColor: NewsColors.textTertiary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── OutlinedButton ──
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: NewsColors.accentCyan,
          side: const BorderSide(color: NewsColors.accentCyan, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── TextField ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: NewsColors.bgLightSoft,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NewsColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NewsColors.borderLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NewsColors.accentCyan, width: 2),
        ),
        hintStyle: const TextStyle(
          color: NewsColors.textTertiary,
          fontSize: 14,
        ),
        labelStyle: const TextStyle(
          color: NewsColors.textSecondary,
          fontSize: 14,
        ),
        prefixIconColor: NewsColors.textSecondary,
        suffixIconColor: NewsColors.accentCyan,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // ── FloatingActionButton ──
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: NewsColors.accentCoral,
        foregroundColor: NewsColors.textOnDark,
        elevation: 4,
        highlightElevation: 8,
      ),

      // ── ProgressIndicator ──
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: NewsColors.accentCyan,
        linearTrackColor: NewsColors.bgLightSoft,
        circularTrackColor: NewsColors.bgLightSoft,
      ),

      // ── Chip ──
      chipTheme: ChipThemeData(
        backgroundColor: NewsColors.bgLightSoft,
        selectedColor: NewsColors.accentCyan,
        side: const BorderSide(color: NewsColors.borderLight, width: 1),
        labelStyle: const TextStyle(
          color: NewsColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),

      // ── Divider ──
      dividerTheme: const DividerThemeData(
        color: NewsColors.dividerLight,
        thickness: 1,
        space: 1,
      ),

      // ── SnackBar ──
      snackBarTheme: SnackBarThemeData(
        backgroundColor: NewsColors.primaryDeep,
        contentTextStyle: const TextStyle(
          color: NewsColors.textOnDark,
          fontSize: 14,
        ),
        actionTextColor: NewsColors.accentCoral,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),

      // ── Text Theme ──
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: NewsColors.textPrimary,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: NewsColors.textPrimary,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: NewsColors.textPrimary,
        ),

        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: NewsColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: NewsColors.textPrimary,
          letterSpacing: -0.2,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: NewsColors.textPrimary,
        ),

        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: NewsColors.textPrimary,
          letterSpacing: -0.2,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: NewsColors.textPrimary,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: NewsColors.textSecondary,
        ),

        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: NewsColors.textPrimary,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: NewsColors.textSecondary,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: NewsColors.textTertiary,
          height: 1.4,
        ),

        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: NewsColors.textPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: NewsColors.textSecondary,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: NewsColors.textTertiary,
          letterSpacing: 0.5,
        ),
      ),

      // ── Icon Theme ──
      iconTheme: const IconThemeData(color: NewsColors.textSecondary, size: 24),
      primaryIconTheme: const IconThemeData(
        color: NewsColors.accentCyan,
        size: 24,
      ),
    );
  }

  // ── DARK THEME ──
  static ThemeData get dark {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,

      primary: NewsColors.accentCoral,
      onPrimary: NewsColors.textOnDark,
      primaryContainer: Color(0xFF7F1D1A),
      onPrimaryContainer: NewsColors.accentCoral,

      secondary: NewsColors.accentGold,
      onSecondary: NewsColors.textOnDark,
      secondaryContainer: Color(0xFF78350F),
      onSecondaryContainer: NewsColors.accentGold,

      tertiary: NewsColors.accentEmerald,
      onTertiary: NewsColors.textOnDark,
      tertiaryContainer: Color(0xFF064E3B),
      onTertiaryContainer: NewsColors.accentEmerald,

      error: NewsColors.error,
      onError: NewsColors.textOnDark,
      errorContainer: Color(0xFF7F1D1A),
      onErrorContainer: Color(0xFFFFDAD6),

      surface: NewsColors.bgDarkCard,
      onSurface: NewsColors.textOnDark,
      surfaceContainerHighest: NewsColors.bgDarkElevated,
      onSurfaceVariant: NewsColors.textOnDarkSub,

      outline: NewsColors.borderDark,
      outlineVariant: NewsColors.dividerDark,
      shadow: Colors.black,
      scrim: Color(0x80000000),
      inverseSurface: NewsColors.bgLight,
      onInverseSurface: NewsColors.textPrimary,
      inversePrimary: NewsColors.accentCyan,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,

      scaffoldBackgroundColor: NewsColors.bgDark,

      // ── AppBar (Dark) ──
      appBarTheme: const AppBarTheme(
        backgroundColor: NewsColors.bgDarkCard,
        foregroundColor: NewsColors.textOnDark,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: NewsColors.bgDark,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: NewsColors.textOnDark,
          letterSpacing: -0.5,
        ),
        iconTheme: IconThemeData(color: NewsColors.accentCoral, size: 24),
      ),

      // ── Cards (Dark) ──
      cardTheme: CardThemeData(
        color: NewsColors.bgDarkCard,
        elevation: 0,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: NewsColors.borderDark, width: 0.5),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── ElevatedButton (Dark) ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NewsColors.accentCoral,
          foregroundColor: NewsColors.textOnDark,
          disabledBackgroundColor: NewsColors.bgDarkElevated,
          disabledForegroundColor: NewsColors.textOnDarkSub,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── OutlinedButton (Dark) ──
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: NewsColors.accentCoral,
          side: const BorderSide(color: NewsColors.accentCoral, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── TextField (Dark) ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: NewsColors.bgDarkElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NewsColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NewsColors.borderDark, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NewsColors.accentCoral, width: 2),
        ),
        hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
        labelStyle: const TextStyle(
          color: NewsColors.textOnDarkSub,
          fontSize: 14,
        ),
        prefixIconColor: NewsColors.textOnDarkSub,
        suffixIconColor: NewsColors.accentCoral,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // ── ProgressIndicator (Dark) ──
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: NewsColors.accentCoral,
        linearTrackColor: NewsColors.bgDarkElevated,
        circularTrackColor: NewsColors.bgDarkElevated,
      ),

      // ── Divider (Dark) ──
      dividerTheme: const DividerThemeData(
        color: NewsColors.dividerDark,
        thickness: 1,
        space: 1,
      ),

      // ── Text Theme (Dark) ──
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: NewsColors.textOnDark,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: NewsColors.textOnDark,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: NewsColors.textOnDark,
        ),

        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: NewsColors.textOnDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: NewsColors.textOnDark,
          letterSpacing: -0.2,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: NewsColors.textOnDark,
        ),

        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: NewsColors.textOnDark,
          letterSpacing: -0.2,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: NewsColors.textOnDark,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: NewsColors.textOnDarkSub,
        ),

        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: NewsColors.textOnDark,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: NewsColors.textOnDarkSub,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF94A3B8),
          height: 1.4,
        ),

        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: NewsColors.textOnDark,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: NewsColors.textOnDarkSub,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Color(0xFF94A3B8),
          letterSpacing: 0.5,
        ),
      ),

      // ── Icon Theme (Dark) ──
      iconTheme: const IconThemeData(color: NewsColors.textOnDarkSub, size: 24),
      primaryIconTheme: const IconThemeData(
        color: NewsColors.accentCoral,
        size: 24,
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
//  READY-TO-USE NEWS CARD WIDGET
// ═══════════════════════════════════════════════════════════

class NewsArticleCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String description;
  final String source;
  final String publishedAt;
  final String? category;
  final VoidCallback? onTap;
  final bool isBreaking;

  const NewsArticleCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.description,
    required this.source,
    required this.publishedAt,
    this.category,
    this.onTap,
    this.isBreaking = false,
  });

  Color _getCategoryColor(String? category) {
    switch (category?.toLowerCase()) {
      case 'technology':
        return NewsColors.catTechnology;
      case 'business':
        return NewsColors.catBusiness;
      case 'sports':
        return NewsColors.catSports;
      case 'health':
        return NewsColors.catHealth;
      case 'entertainment':
        return NewsColors.catEntertainment;
      case 'science':
        return NewsColors.catScience;
      default:
        return NewsColors.catGeneral;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image with category badge ──
            Stack(
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  color: isDark
                      ? NewsColors.bgDarkElevated
                      : NewsColors.bgLightSoft,
                  child: imageUrl != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl!,
                            fit: BoxFit.cover,

                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),

                            errorWidget: (context, url, error) =>
                                const Icon(Icons.image_not_supported),
                          ),
                        )
                      : Icon(Icons.image_not_supported_outlined, size: 48),
                ),
                if (isBreaking)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: NewsColors.accentRed,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'BREAKING',
                        style: TextStyle(
                          color: NewsColors.textOnDark,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                if (category != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(category).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        category!.toUpperCase(),
                        style: const TextStyle(
                          color: NewsColors.textOnDark,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // ── Content ──
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Description
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),

                  // Footer (source + date)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          source,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? NewsColors.accentCoral
                                    : NewsColors.accentCyan,
                              ),
                        ),
                      ),
                      Text(
                        publishedAt,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
//  NEW COLOR PALETTE
//
//  Light Mode:
//  - Primary: Cyan (#06B6D4)
//  - Secondary: Coral (#FF6B6B)
//  - Tertiary: Emerald (#10B981)
//  - Background: Very light (#F8FAFC)
//
//  Dark Mode:
//  - Primary: Coral (#FF6B6B)
//  - Secondary: Gold (#FCD34D)
//  - Tertiary: Emerald (#10B981)
//  - Background: Deep Navy (#0F172A)
//
//  Category Colors (Vibrant):
//  - Technology: Purple (#8B5CF6)
//  - Business: Blue (#3B82F6)
//  - Sports: Pink (#EC4899)
//  - Health: Teal (#14B8A6)
//  - Entertainment: Amber (#F59E0B)
//  - Science: Cyan (#06B6D4)
// ═══════════════════════════════════════════════════════════
