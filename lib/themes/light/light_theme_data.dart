part of '../app_theme.dart';

ThemeData _lightThemeData({String? fontFamily}) {
  final design = CustomDesigns.light();
  final baseDesign = BaseDesigns.instance;
  final colorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: design.mainColor,
    secondary: design.secondaryColor,
  );

  final styleFrom = ElevatedButton.styleFrom(
    backgroundColor: design.mainColor,
    foregroundColor: design.secondaryColor,
  );
  return ThemeData(
    useMaterial3: true,
    primaryColor: design.mainColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: design.mainColor,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 20,
        color: design.neutral.tone0,
      ),
      backgroundColor: design.mainColor,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 4,
        foregroundColor: design.mainColor,
        backgroundColor: colorScheme.surface,
        side: BorderSide(
          color: colorScheme.surface,
          width: 0,
        ),
        shadowColor: colorScheme.surface,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.surface,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 96,
        letterSpacing: -1.5,
        color: design.neutral.tone0,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 60,
        letterSpacing: -0.5,
        color: design.neutral.tone0,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 48,
        letterSpacing: 0,
        color: design.neutral.tone0,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 28,
        color: design.neutral.tone0,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 24,
        color: design.neutral.tone0,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 18,
        color: design.neutral.tone0,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 16,
        color: design.neutral.tone0,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 14,
        color: design.neutral.tone0,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 16,
        letterSpacing: 0.5,
        color: design.neutral.tone0,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 14,
        letterSpacing: 0.25,
        color: design.neutral.tone0,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 12,
        letterSpacing: 0.4,
        color: design.neutral.tone0,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 14,
        letterSpacing: 1.25,
        color: design.neutral.tone0,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 12,
        letterSpacing: 1.5,
        color: design.neutral.tone0,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: fontFamily,
        fontSize: 10,
        letterSpacing: 1.5,
        color: design.neutral.tone0,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: design.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelPadding: const EdgeInsets.symmetric(vertical: 8),
      labelStyle: TextStyle(
        color: design.neutral.tone0,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      unselectedLabelStyle: TextStyle(
        color: design.neutral.tone0,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
    scaffoldBackgroundColor: design.neutral.tone80,
    primaryColorLight: design.mainColor,
    dividerColor: design.neutral.tone50,
    canvasColor: design.mainColor,
    textButtonTheme: TextButtonThemeData(style: styleFrom),
    elevatedButtonTheme: ElevatedButtonThemeData(style: styleFrom),
    colorScheme: colorScheme.copyWith(
      surface: design.mainColor,
    ),
    extensions: [
      design,
      baseDesign,
    ],
  );
}
