import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ═══════════════════════════════════════════════════════════
//  NEWS HUB — Professional News App Color Theme
//  Modern, clean, and readable for text-heavy content
// ═══════════════════════════════════════════════════════════

class NewsColors {
  NewsColors._();

  // ── Primary Colors (Trust & Authority) ──
  static const Color primaryDeep    = Color(0xFF1A1A1A);  // deep charcoal
  static const Color primaryMedium  = Color(0xFF2D2D2D);  // dark gray
  static const Color primaryLight   = Color(0xFF3F3F3F);  // medium gray

  // ── Accent Colors (Energy & Call-to-Action) ──
  static const Color accentRed      = Color(0xFFD32F2F);  // breaking news / hot
  static const Color accentOrange   = Color(0xFFFF6F00);  // featured / trending
  static const Color accentBlue     = Color(0xFF1976D2);  // links / primary action
  static const Color accentTeal     = Color(0xFF00897B);  // secondary action
  static const Color accentGreen    = Color(0xFF388E3C);  // success / verified

  // ── Text Colors ──
  static const Color textPrimary    = Color(0xFF1A1A1A);  // headlines (light mode)
  static const Color textSecondary  = Color(0xFF666666);  // descriptions (light mode)
  static const Color textTertiary   = Color(0xFF999999);  // metadata (light mode)
  static const Color textOnDark     = Color(0xFFFFFFFF);  // on dark backgrounds
  static const Color textOnDarkSub  = Color(0xFFE0E0E0);  // secondary on dark

  // ── Background Colors (Light Mode) ──
  static const Color bgLight        = Color(0xFFFAFAFA);  // scaffold
  static const Color bgLightCard    = Color(0xFFFFFFFF);  // card surface
  static const Color bgLightSoft    = Color(0xFFF5F5F5);  // soft background

  // ── Background Colors (Dark Mode) ──
  static const Color bgDark         = Color(0xFF121212);  // scaffold
  static const Color bgDarkCard     = Color(0xFF1E1E1E);  // card surface
  static const Color bgDarkElevated = Color(0xFF2A2A2A);  // elevated cards

  // ── Borders & Dividers ──
  static const Color borderLight    = Color(0xFFE0E0E0);  // light mode borders
  static const Color borderDark     = Color(0xFF333333);  // dark mode borders
  static const Color dividerLight   = Color(0xFFEEEEEE);
  static const Color dividerDark    = Color(0xFF2A2A2A);

  // ── Status Colors ──
  static const Color success        = Color(0xFF4CAF50);
  static const Color warning        = Color(0xFFFFC107);
  static const Color error          = Color(0xFFE53935);
  static const Color info           = Color(0xFF2196F3);

  // ── Category Colors (for category badges) ──
  static const Color catTechnology  = Color(0xFF00ACC1);  // cyan
  static const Color catBusiness    = Color(0xFF1565C0);  // blue
  static const Color catSports      = Color(0xFFC62828);  // red
  static const Color catHealth      = Color(0xFF00796B);  // teal
  static const Color catEntertainment = Color(0xFF6A1B9A); // purple
  static const Color catScience     = Color(0xFF0277BD);  // light blue
  static const Color catGeneral     = Color(0xFF616161);  // gray

  // ── Gradients ──
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentRed, accentOrange],
  );

  static const LinearGradient trendingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [accentOrange, Color(0xFFE65100)],
  );

  static const LinearGradient featureGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentBlue, accentTeal],
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
      primary:            NewsColors.accentBlue,
      onPrimary:          NewsColors.textOnDark,
      primaryContainer:   Color(0xFFE3F2FD),
      onPrimaryContainer: NewsColors.accentBlue,

      // Secondary
      secondary:            NewsColors.accentOrange,
      onSecondary:          NewsColors.textOnDark,
      secondaryContainer:   Color(0xFFFFE0B2),
      onSecondaryContainer: NewsColors.accentOrange,

      // Tertiary
      tertiary:            NewsColors.accentTeal,
      onTertiary:          NewsColors.textOnDark,
      tertiaryContainer:   Color(0xFFB2DFDB),
      onTertiaryContainer: NewsColors.accentTeal,

      // Error
      error:            NewsColors.error,
      onError:          NewsColors.textOnDark,
      errorContainer:   Color(0xFFFFEBEE),
      onErrorContainer: NewsColors.error,

      // Surface
      surface:                 NewsColors.bgLightCard,
      onSurface:               NewsColors.textPrimary,
      surfaceContainerHighest: NewsColors.bgLightSoft,
      onSurfaceVariant:        NewsColors.textSecondary,

      outline:        NewsColors.borderLight,
      outlineVariant: NewsColors.dividerLight,
      shadow:         NewsColors.shadowColor,
      scrim:          Color(0x66000000),
      inverseSurface:   NewsColors.primaryDeep,
      onInverseSurface: NewsColors.textOnDark,
      inversePrimary:   NewsColors.accentOrange,
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
        elevation: 1,
        centerTitle: false,
        scrolledUnderElevation: 2,
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
        iconTheme: IconThemeData(color: NewsColors.accentBlue, size: 24),
      ),

      // ── Cards ──
      cardTheme: CardThemeData(
        color: NewsColors.bgLightCard,
        elevation: 1,
        shadowColor: NewsColors.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: NewsColors.borderLight, width: 0.5),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── ElevatedButton ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NewsColors.accentBlue,
          foregroundColor: NewsColors.textOnDark,
          disabledBackgroundColor: NewsColors.bgLightSoft,
          disabledForegroundColor: NewsColors.textTertiary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── OutlinedButton ──
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: NewsColors.accentBlue,
          side: const BorderSide(color: NewsColors.accentBlue, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── TextField ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: NewsColors.bgLightSoft,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: NewsColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: NewsColors.borderLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: NewsColors.accentBlue, width: 2),
        ),
        hintStyle: const TextStyle(color: NewsColors.textTertiary, fontSize: 14),
        labelStyle: const TextStyle(color: NewsColors.textSecondary, fontSize: 14),
        prefixIconColor: NewsColors.textSecondary,
        suffixIconColor: NewsColors.accentBlue,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── FloatingActionButton ──
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: NewsColors.accentRed,
        foregroundColor: NewsColors.textOnDark,
        elevation: 4,
        highlightElevation: 8,
      ),

      // ── ProgressIndicator ──
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: NewsColors.accentBlue,
        linearTrackColor: NewsColors.bgLightSoft,
        circularTrackColor: NewsColors.bgLightSoft,
      ),

      // ── Chip ──
      chipTheme: ChipThemeData(
        backgroundColor: NewsColors.bgLightSoft,
        selectedColor: NewsColors.accentBlue,
        side: const BorderSide(color: NewsColors.borderLight, width: 1),
        labelStyle: const TextStyle(color: NewsColors.textPrimary, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
        contentTextStyle: const TextStyle(color: NewsColors.textOnDark, fontSize: 14),
        actionTextColor: NewsColors.accentOrange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),

      // ── Text Theme ──
      textTheme: const TextTheme(
        displayLarge:  TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: NewsColors.textPrimary, letterSpacing: -1.5),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: NewsColors.textPrimary, letterSpacing: -0.5),
        displaySmall:  TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: NewsColors.textPrimary),

        headlineLarge:  TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: NewsColors.textPrimary),
        headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: NewsColors.textPrimary, letterSpacing: -0.2),
        headlineSmall:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: NewsColors.textPrimary),

        titleLarge:    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: NewsColors.textPrimary, letterSpacing: -0.2),
        titleMedium:   TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: NewsColors.textPrimary),
        titleSmall:    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: NewsColors.textSecondary),

        bodyLarge:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: NewsColors.textPrimary, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: NewsColors.textSecondary, height: 1.5),
        bodySmall:  TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: NewsColors.textTertiary, height: 1.4),

        labelLarge:  TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: NewsColors.textPrimary),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: NewsColors.textSecondary),
        labelSmall:  TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: NewsColors.textTertiary, letterSpacing: 0.5),
      ),

      // ── Icon Theme ──
      iconTheme: const IconThemeData(color: NewsColors.textSecondary, size: 24),
      primaryIconTheme: const IconThemeData(color: NewsColors.accentBlue, size: 24),
    );
  }

  // ── DARK THEME ──
  static ThemeData get dark {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      
      primary:            NewsColors.accentOrange,
      onPrimary:          NewsColors.textOnDark,
      primaryContainer:   Color(0xFFE65100),
      onPrimaryContainer: NewsColors.accentOrange,

      secondary:            NewsColors.accentTeal,
      onSecondary:          NewsColors.textOnDark,
      secondaryContainer:   Color(0xFF004D40),
      onSecondaryContainer: NewsColors.accentTeal,

      tertiary:            NewsColors.accentBlue,
      onTertiary:          NewsColors.textOnDark,
      tertiaryContainer:   Color(0xFF0D47A1),
      onTertiaryContainer: NewsColors.accentBlue,

      error:            NewsColors.error,
      onError:          NewsColors.textOnDark,
      errorContainer:   Color(0xFFB71C1C),
      onErrorContainer: Color(0xFFFFCDD2),

      surface:                 NewsColors.bgDarkCard,
      onSurface:               NewsColors.textOnDark,
      surfaceContainerHighest: NewsColors.bgDarkElevated,
      onSurfaceVariant:        NewsColors.textOnDarkSub,

      outline:        NewsColors.borderDark,
      outlineVariant: NewsColors.dividerDark,
      shadow:         Colors.black,
      scrim:          Color(0x80000000),
      inverseSurface:   NewsColors.bgLight,
      onInverseSurface: NewsColors.textPrimary,
      inversePrimary:   NewsColors.accentBlue,
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
        elevation: 1,
        centerTitle: false,
        scrolledUnderElevation: 2,
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
        iconTheme: IconThemeData(color: NewsColors.accentOrange, size: 24),
      ),

      // ── Cards (Dark) ──
      cardTheme: CardThemeData(
        color: NewsColors.bgDarkCard,
        elevation: 2,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: NewsColors.borderDark, width: 0.5),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── ElevatedButton (Dark) ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NewsColors.accentOrange,
          foregroundColor: NewsColors.textOnDark,
          disabledBackgroundColor: NewsColors.bgDarkElevated,
          disabledForegroundColor: NewsColors.textOnDarkSub,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── OutlinedButton (Dark) ──
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: NewsColors.accentOrange,
          side: const BorderSide(color: NewsColors.accentOrange, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),

      // ── TextField (Dark) ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: NewsColors.bgDarkElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: NewsColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: NewsColors.borderDark, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: NewsColors.accentOrange, width: 2),
        ),
        hintStyle: const TextStyle(color: Color(0xFF666666), fontSize: 14),
        labelStyle: const TextStyle(color: NewsColors.textOnDarkSub, fontSize: 14),
        prefixIconColor: NewsColors.textOnDarkSub,
        suffixIconColor: NewsColors.accentOrange,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── ProgressIndicator (Dark) ──
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: NewsColors.accentOrange,
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
        displayLarge:  TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: NewsColors.textOnDark, letterSpacing: -1.5),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: NewsColors.textOnDark, letterSpacing: -0.5),
        displaySmall:  TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: NewsColors.textOnDark),

        headlineLarge:  TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: NewsColors.textOnDark),
        headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: NewsColors.textOnDark, letterSpacing: -0.2),
        headlineSmall:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: NewsColors.textOnDark),

        titleLarge:    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: NewsColors.textOnDark, letterSpacing: -0.2),
        titleMedium:   TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: NewsColors.textOnDark),
        titleSmall:    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: NewsColors.textOnDarkSub),

        bodyLarge:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: NewsColors.textOnDark, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: NewsColors.textOnDarkSub, height: 1.5),
        bodySmall:  TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF999999), height: 1.4),

        labelLarge:  TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: NewsColors.textOnDark),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: NewsColors.textOnDarkSub),
        labelSmall:  TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF666666), letterSpacing: 0.5),
      ),

      // ── Icon Theme (Dark) ──
      iconTheme: const IconThemeData(color: NewsColors.textOnDarkSub, size: 24),
      primaryIconTheme: const IconThemeData(color: NewsColors.accentOrange, size: 24),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image with category badge ──
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  color: isDark ? NewsColors.bgDarkElevated : NewsColors.bgLightSoft,
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.image_not_supported_outlined,
                            size: 48,
                            color: isDark ? NewsColors.textOnDarkSub : NewsColors.textTertiary,
                          ),
                        )
                      : Icon(
                          Icons.image_not_supported_outlined,
                          size: 48,
                          color: isDark ? NewsColors.textOnDarkSub : NewsColors.textTertiary,
                        ),
                ),
                if (isBreaking)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: NewsColors.accentRed,
                        borderRadius: BorderRadius.circular(4),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(category).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(6),
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
              padding: const EdgeInsets.all(12),
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
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isDark ? NewsColors.accentOrange : NewsColors.accentBlue,
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
//  USAGE IN main.dart
//
//  void main() {
//    runApp(const MyApp());
//  }
//
//  class MyApp extends StatelessWidget {
//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//        title: 'News Hub',
//        theme: NewsTheme.light,
//        darkTheme: NewsTheme.dark,
//        themeMode: ThemeMode.system,  // or .light, .dark
//        home: const HomeScreen(),
//      );
//    }
//  }
//
//  IN YOUR NEWS CARD LIST:
//
//  ListView.builder(
//    itemCount: newsList.length,
//    itemBuilder: (ctx, idx) => Padding(
//      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//      child: NewsArticleCard(
//        imageUrl: newsList[idx].image,
//        title: newsList[idx].title,
//        description: newsList[idx].description,
//        source: newsList[idx].source,
//        publishedAt: newsList[idx].publishedAt,
//        category: newsList[idx].category,
//        isBreaking: newsList[idx].isBreaking,
//        onTap: () => Navigator.push(context, MaterialPageRoute(
//          builder: (_) => DetailsScreen(article: newsList[idx]),
//        )),
//      ),
//    ),
//  )
// ═══════════════════════════════════════════════════════════