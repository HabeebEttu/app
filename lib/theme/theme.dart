import 'package:flutter/material.dart';

/// ============================================================================
/// AGRIEGG THEME
/// Complete design system for the AgriEgg Flutter application
/// ============================================================================

// ============================================================================
// SECTION 1: COLOR PALETTE
// ============================================================================

/// Central color palette for the AgriEgg app
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1B5E3F); // Dark forest green
  static const Color primaryLight = Color(0xFF2E7D32); // Sage green
  static const Color primaryLighter = Color(0xFF66BB6A); // Light sage
  static const Color primaryLightest = Color(0xFFC8E6C9); // Very light green

  // Status Colors
  static const Color error = Color(0xFFD32F2F); // Red for debt/negative
  static const Color errorLight = Color(0xFFEF5350); // Lighter red
  static const Color success = Color(0xFF2E7D32); // Green for settled/positive
  static const Color successLight = Color(0xFF66BB6A); // Light green
  static const Color warning = Color(0xFFF57C00); // Orange for pending

  // Neutral Colors
  static const Color darkText = Color(0xFF1C1C1C); // Primary text
  static const Color lightText = Color(0xFF757575); // Secondary text
  static const Color hintText = Color(0xFFBDBDBD); // Hint text
  static const Color background = Color(0xFFFAFAF3); // Light background
  static const Color surface = Color(0xFFFFFFFF); // Card/surface background
  static const Color border = Color(0xFFE0E0E0); // Light borders
  static const Color divider = Color(0xFFBDBDBD); // Dividers

  // Special colors
  static const Color debtRed = Color(0xFFD32F2F);
  static const Color clearGreen = Color(0xFF2E7D32);
  static const Color creditGreen = Color(0xFF66BB6A);
}

// ============================================================================
// SECTION 2: TYPOGRAPHY & TEXT STYLES
// ============================================================================

/// Text styles following Material Design principles
class AppTextStyles {
  // Display styles (not commonly used, but available)
  static const TextStyle display1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    height: 1.2,
  );

  // Headline styles

  /// Used for: Main screen titles (Settings, New Activity, Recent Orders)
  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    height: 1.3,
    letterSpacing: -0.5,
  );

  /// Used for: Section headers, customer names
  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
    height: 1.3,
  );

  /// Used for: Card titles, subheadings
  static const TextStyle headline3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
    height: 1.3,
  );

  /// Used for: Small labels, category headers
  static const TextStyle headline4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.lightText,
    height: 1.3,
  );

  // Body text styles

  /// Used for: Primary body text, descriptions
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.darkText,
    height: 1.5,
  );

  /// Used for: Secondary text, metadata
  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.darkText,
    height: 1.5,
  );

  /// Used for: Caption text, timestamps
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.lightText,
    height: 1.4,
  );

  /// Used for: Very small text, helper text
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.hintText,
    height: 1.4,
    letterSpacing: 0.5,
  );

  // Special styles

  /// Used for: Amount displays, balances
  static const TextStyle amountLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    height: 1.2,
  );

  /// Used for: Currency or balance text
  static const TextStyle amountMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    height: 1.2,
  );

  /// Used for: Small amounts or secondary currency
  static const TextStyle amountSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
    height: 1.2,
  );

  // Error/Status styles
  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.error,
    height: 1.4,
  );

  static const TextStyle successText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.success,
    height: 1.4,
  );
}

// ============================================================================
// SECTION 3: SPACING CONSTANTS
// ============================================================================

/// Consistent spacing system throughout the app
class AppSpacing {
  // Micro spacing
  static const double xs = 4.0;
  static const double sm = 8.0;

  // Standard spacing
  static const double md = 12.0;
  static const double lg = 16.0;

  // Large spacing
  static const double xl = 24.0;
  static const double xxl = 32.0;

  // Extra large spacing
  static const double xxxl = 48.0;
}

// ============================================================================
// SECTION 4: BORDER RADIUS & DIMENSIONS
// ============================================================================

/// Border radius constants for consistent rounded corners
class AppBorderRadius {
  static const double small = 4.0;
  static const double medium = 8.0;
  static const double large = 12.0;
  static const double xlarge = 16.0;
  static const double circle = 100.0;

  static const BorderRadius smallRadius = BorderRadius.all(
    Radius.circular(small),
  );
  static const BorderRadius mediumRadius = BorderRadius.all(
    Radius.circular(medium),
  );
  static const BorderRadius largeRadius = BorderRadius.all(
    Radius.circular(large),
  );
  static const BorderRadius xlargeRadius = BorderRadius.all(
    Radius.circular(xlarge),
  );
}

/// Common dimensions used throughout the app
class AppDimensions {
  // Icon sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;

  // Button heights
  static const double buttonSmall = 36.0;
  static const double buttonMedium = 44.0;
  static const double buttonLarge = 52.0;

  // Card dimensions
  static const double cardElevation = 2.0;
  static const double cardElevationHigh = 4.0;

  // Bottom navigation
  static const double bottomNavHeight = 64.0;

  // Divider thickness
  static const double dividerThickness = 1.0;
  static const double dividersideThickness = 4.0; // Side accent on cards
}

// ============================================================================
// SECTION 5: SHADOW & ELEVATION
// ============================================================================

/// Shadow definitions for consistent elevation
class AppShadows {
  static const BoxShadow small = BoxShadow(
    color: Color(0x0D000000), // 5% black
    blurRadius: 4,
    offset: Offset(0, 2),
  );

  static const BoxShadow medium = BoxShadow(
    color: Color(0x14000000), // 8% black
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow large = BoxShadow(
    color: Color(0x1F000000), // 12% black
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  static const List<BoxShadow> smallList = [small];
  static const List<BoxShadow> mediumList = [medium];
  static const List<BoxShadow> largeList = [large];
}

// ============================================================================
// SECTION 6: INPUT DECORATION & FORM STYLES
// ============================================================================

/// Form and input field styling
class AppInputStyles {
  static InputDecoration searchInputDecoration({
    String hintText = 'Search...',
  }) => InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 14),
    prefixIcon: const Icon(Icons.search, color: AppColors.lightText, size: 20),
    filled: true,
    fillColor: const Color.fromARGB(255, 224, 224, 224),
    border: OutlineInputBorder(
      borderRadius: AppBorderRadius.mediumRadius,
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.mediumRadius,
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.mediumRadius,
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
  );

  static InputDecoration textInputDecoration({
    String labelText = '',
    String hintText = '',
  }) => InputDecoration(
    labelText: labelText,
    hintText: hintText,
    labelStyle: const TextStyle(color: AppColors.lightText, fontSize: 18),
    hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 16),
    filled: true,
    fillColor: AppColors.background,
    border: OutlineInputBorder(
      borderRadius: AppBorderRadius.mediumRadius,
      borderSide: const BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.mediumRadius,
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.mediumRadius,
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
  );
}

// ============================================================================
// SECTION 7: BUTTON STYLES
// ============================================================================

/// Custom button styling configurations
class AppButtonStyles {
  // Primary Button
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.largeRadius),
  );

  // Secondary Button
  static ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.border,
    foregroundColor: AppColors.darkText,
    elevation: 0,

    // side: const BorderSide(color: AppColors.border),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.largeRadius),
  );

  // Pill Button (for filters, toggles)
  static ButtonStyle pillButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryLightest,
    foregroundColor: AppColors.primary,
    elevation: 0,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.sm,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppBorderRadius.circle),
    ),
  );

  // Text Button
  static ButtonStyle textButton = TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.sm,
    ),
  );

  // Icon Button
  static ButtonStyle iconButton = IconButton.styleFrom(
    foregroundColor: AppColors.primary,
  );
}

// ============================================================================
// SECTION 8: CHIP STYLES
// ============================================================================

/// Chip and tag styling
class AppChipStyles {
  static ChipThemeData chipTheme = ChipThemeData(
    backgroundColor: const Color.fromARGB(255, 235, 235, 235),
    selectedColor: AppColors.primaryLightest,
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadiusGeometry.circular(10),
    ),
    secondarySelectedColor: AppColors.primaryLightest,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.sm,
    ),
    labelStyle: const TextStyle(
      color: AppColors.darkText,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    brightness: Brightness.light,
  );
}

// ============================================================================
// SECTION 9: CARD STYLES
// ============================================================================

/// Card decoration patterns used throughout the app
class AppCardStyles {
  // Standard card with subtle shadow
  static BoxDecoration standardCard = BoxDecoration(
    color: AppColors.surface,
    borderRadius: AppBorderRadius.largeRadius,
    boxShadow: AppShadows.smallList,
  );

  // Card with left border accent (for status indication)
  static BoxDecoration debtCard = BoxDecoration(
    color: AppColors.surface,
    borderRadius: AppBorderRadius.largeRadius,
    border: const Border(
      left: BorderSide(
        color: AppColors.error,
        width: AppDimensions.dividersideThickness,
      ),
    ),
    boxShadow: AppShadows.smallList,
  );

  static BoxDecoration successCard = BoxDecoration(
    color: AppColors.surface,
    borderRadius: AppBorderRadius.largeRadius,
    border: const Border(
      left: BorderSide(
        color: AppColors.success,
        width: AppDimensions.dividersideThickness,
      ),
    ),
    boxShadow: AppShadows.smallList,
  );

  static BoxDecoration warningCard = BoxDecoration(
    color: AppColors.surface,
    borderRadius: AppBorderRadius.largeRadius,
    border: const Border(
      left: BorderSide(
        color: AppColors.warning,
        width: AppDimensions.dividersideThickness,
      ),
    ),
    boxShadow: AppShadows.smallList,
  );

  // Highlight card (e.g., customer account summary)
  static BoxDecoration highlightCard = BoxDecoration(
    color: AppColors.primary,
    borderRadius: AppBorderRadius.largeRadius,
    boxShadow: AppShadows.mediumList,
  );
  static BoxDecoration formCard = BoxDecoration(
    color: const Color.fromARGB(255, 230, 230, 230),
    borderRadius: AppBorderRadius.mediumRadius,
  );
}

// ============================================================================
// SECTION 10: MAIN THEME DATA
// ============================================================================

/// Complete theme configuration for the app
class AppTheme {
  /// Light theme configuration
  static ThemeData lightTheme() {
    return ThemeData(
      // Color Scheme
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryLightest,
        onPrimaryContainer: AppColors.primary,
        secondary: AppColors.primaryLight,
        onSecondary: Colors.white,
        tertiary: AppColors.primaryLighter,
        error: AppColors.error,
        onError: Colors.white,
        surface: AppColors.surface,
        onSurface: AppColors.darkText,
      ),

      // Scaffold
      scaffoldBackgroundColor: AppColors.background,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headline2.copyWith(
          color: AppColors.darkText,
        ),
        iconTheme: const IconThemeData(color: AppColors.darkText),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.display1,
        headlineLarge: AppTextStyles.headline1,
        headlineMedium: AppTextStyles.headline2,
        headlineSmall: AppTextStyles.headline3,
        titleMedium: AppTextStyles.headline4,
        bodyLarge: AppTextStyles.bodyText1,
        bodyMedium: AppTextStyles.bodyText2,
        labelLarge: AppTextStyles.bodyText1,
        labelSmall: AppTextStyles.overline,
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppButtonStyles.primaryButton,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: AppButtonStyles.secondaryButton,
      ),

      textButtonTheme: TextButtonThemeData(style: AppButtonStyles.textButton),

      iconButtonTheme: IconButtonThemeData(style: AppButtonStyles.iconButton),

      // Chip Theme
      chipTheme: AppChipStyles.chipTheme,

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.background,
        labelStyle: const TextStyle(color: AppColors.lightText, fontSize: 14),
        hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.mediumRadius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.mediumRadius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.mediumRadius,
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: AppDimensions.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.largeRadius,
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: AppDimensions.dividerThickness,
        space: 1,
      ),

      // Bottom Navigation Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.lightText,
        elevation: AppDimensions.cardElevationHigh,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.caption.copyWith(
          color: AppColors.primary,
        ),
        unselectedLabelStyle: AppTextStyles.caption.copyWith(
          color: AppColors.lightText,
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: AppDimensions.cardElevationHigh,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.largeRadius,
        ),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.hintText;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryLightest;
          }
          return AppColors.border;
        }),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.border;
        }),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.border;
        }),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkText,
        contentTextStyle: AppTextStyles.bodyText2.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.mediumRadius,
        ),
      ),
    );
  }

  /// Dark theme configuration (optional)
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLighter,
        onPrimary: AppColors.primary,
        primaryContainer: AppColors.primary,
        onPrimaryContainer: AppColors.primaryLightest,
        secondary: AppColors.primaryLighter,
        onSecondary: AppColors.primary,
        error: AppColors.errorLight,
        onError: AppColors.error,
        surface: Color(0xFF1E1E1E),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: Color(0xFF121212),
      // Add other dark theme customizations as needed
    );
  }
}

// ============================================================================
// SECTION 11: UTILITY EXTENSIONS
// ============================================================================

/// Extension methods for convenient styling
extension BuildContextExtension on BuildContext {
  /// Get current theme data
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Check if dark mode is enabled
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

/// Helper function for status color based on balance
Color getStatusColor(double balance) {
  if (balance < 0) {
    return AppColors.error; // Debt
  } else if (balance == 0) {
    return AppColors.success; // Clear
  } else {
    return AppColors.success; // Credit available
  }
}

/// Helper function for status text based on balance
String getStatusText(double balance) {
  if (balance < 0) {
    return 'Due Balance';
  } else if (balance == 0) {
    return 'Clear';
  } else {
    return 'Credit Available';
  }
}

/// Helper function for status icon based on balance
IconData getStatusIcon(double balance) {
  if (balance < 0) {
    return Icons.warning_amber_rounded; // Warning for debt
  } else if (balance == 0) {
    return Icons.check_circle; // Check for clear
  } else {
    return Icons.favorite_rounded; // Heart for credit
  }
}

// ============================================================================
// END OF THEME FILE
// ============================================================================
