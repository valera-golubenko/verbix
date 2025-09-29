import 'package:flutter/material.dart';

@immutable
class CustomDesigns extends ThemeExtension<CustomDesigns> {
  final Color mainColor;
  final Color mainDarker;
  final Color mainLighter;
  final Color mainSubtle;
  final Color secondaryColor;
  final Color secondaryDarker;
  final Color secondaryLighter;
  final Color secondarySubtle;
  final Color statusError;
  final Color statusWarning;
  final Color statusInfo;
  final Color statusSuccess;
  final ColorsSet neutral;
  final LinearGradient gradient;

  const CustomDesigns._({
    required this.mainColor,
    required this.mainDarker,
    required this.mainLighter,
    required this.mainSubtle,
    required this.secondaryColor,
    required this.secondaryDarker,
    required this.secondaryLighter,
    required this.secondarySubtle,
    required this.statusError,
    required this.statusWarning,
    required this.statusInfo,
    required this.statusSuccess,
    required this.neutral,
    required this.gradient,
  });

  factory CustomDesigns.light() {
    final base = BaseDesigns.instance;
    return CustomDesigns._(
      mainColor: base.mainColor,
      mainDarker: base.mainDarker,
      mainLighter: base.mainLighter,
      mainSubtle: base.mainSubtle,
      secondaryColor: base.secondaryColor,
      secondaryDarker: base.secondaryDarker,
      secondaryLighter: base.secondaryLighter,
      secondarySubtle: base.secondarySubtle,
      statusError: base.statusError,
      statusWarning: base.statusWarning,
      statusInfo: base.statusInfo,
      statusSuccess: base.statusSuccess,
      neutral: base.neutral,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          base.mainColor,
          base.secondaryColor,
        ],
        stops: [
          0.0,
          1.0,
        ],
      ),
    );
  }

  factory CustomDesigns.dark() {
    final base = BaseDesigns.instance;
    return CustomDesigns._(
      mainColor: base.mainColor,
      mainDarker: base.mainDarker,
      mainLighter: base.mainLighter,
      mainSubtle: base.mainSubtle,
      secondaryColor: base.secondaryColor,
      secondaryDarker: base.secondaryDarker,
      secondaryLighter: base.secondaryLighter,
      secondarySubtle: base.secondarySubtle,
      statusError: base.statusError,
      statusWarning: base.statusWarning,
      statusInfo: base.statusInfo,
      statusSuccess: base.statusSuccess,
      neutral: base.neutral,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          base.mainColor,
          base.secondaryColor,
        ],
        stops: [
          0.0,
          1.0,
        ],
      ),
    );
  }

  @override
  ThemeExtension<CustomDesigns> copyWith({
    Color? mainColor,
    Color? mainDarker,
    Color? mainLighter,
    Color? mainSubtle,
    Color? secondaryColor,
    Color? secondaryDarker,
    Color? secondaryLighter,
    Color? secondarySubtle,
    Color? statusError,
    Color? statusWarning,
    Color? statusInfo,
    Color? statusSuccess,
    ColorsSet? neutral,
    LinearGradient? gradient,
  }) {
    return CustomDesigns._(
      mainColor: mainColor ?? this.mainColor,
      mainDarker: mainDarker ?? this.mainDarker,
      mainLighter: mainLighter ?? this.mainLighter,
      mainSubtle: mainSubtle ?? this.mainSubtle,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondaryDarker: secondaryDarker ?? this.secondaryDarker,
      secondaryLighter: secondaryLighter ?? this.secondaryLighter,
      secondarySubtle: secondarySubtle ?? this.secondarySubtle,
      statusError: statusError ?? this.statusError,
      statusWarning: statusWarning ?? this.statusWarning,
      statusInfo: statusInfo ?? this.statusInfo,
      statusSuccess: statusSuccess ?? this.statusSuccess,
      neutral: neutral ?? this.neutral,
      gradient: gradient ?? this.gradient,
    );
  }

  @override
  ThemeExtension<CustomDesigns> lerp(
    covariant ThemeExtension<CustomDesigns>? other,
    double t,
  ) {
    if (other is! CustomDesigns) {
      return this;
    }
    return CustomDesigns._(
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      mainDarker: Color.lerp(mainDarker, other.mainDarker, t)!,
      mainLighter: Color.lerp(mainLighter, other.mainLighter, t)!,
      mainSubtle: Color.lerp(mainSubtle, other.mainSubtle, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      secondaryDarker: Color.lerp(secondaryDarker, other.secondaryDarker, t)!,
      secondaryLighter:
          Color.lerp(secondaryLighter, other.secondaryLighter, t)!,
      secondarySubtle: Color.lerp(secondarySubtle, other.secondarySubtle, t)!,
      statusError: Color.lerp(statusError, other.statusError, t)!,
      statusWarning: Color.lerp(statusWarning, other.statusWarning, t)!,
      statusInfo: Color.lerp(statusInfo, other.statusInfo, t)!,
      statusSuccess: Color.lerp(statusSuccess, other.statusSuccess, t)!,
      neutral: ColorsSet.lerp(neutral, other.neutral, t),
      gradient: LinearGradient.lerp(gradient, other.gradient, t) ?? gradient,
    );
  }
}

@immutable
class BaseDesigns extends ThemeExtension<BaseDesigns> {
  final Color mainColor;
  final Color mainDarker;
  final Color mainLighter;
  final Color mainSubtle;
  final Color secondaryColor;
  final Color secondaryDarker;
  final Color secondaryLighter;
  final Color secondarySubtle;
  final Color statusError;
  final Color statusWarning;
  final Color statusInfo;
  final Color statusSuccess;
  final ColorsSet neutral;

  const BaseDesigns._({
    required this.mainColor,
    required this.mainDarker,
    required this.mainLighter,
    required this.mainSubtle,
    required this.secondaryColor,
    required this.secondaryDarker,
    required this.secondaryLighter,
    required this.secondarySubtle,
    required this.statusError,
    required this.statusWarning,
    required this.statusInfo,
    required this.statusSuccess,
    required this.neutral,
  });

  static BaseDesigns get instance {
    return const BaseDesigns._(
      mainColor: Color(0xFF2563EB),
      mainDarker: Color(0xFFF2659BF),
      mainLighter: Color(0xFF99BBFF),
      mainSubtle: Color(0xFFE3EDFF),
      secondaryColor: Color(0xFFFE9519),
      secondaryDarker: Color(0xFFFEA419),
      secondaryLighter: Color(0xFFFEC875),
      secondarySubtle: Color(0xFFFFF6E8),
      statusError: Color(0xFFE2222E),
      statusWarning: Color(0xFFFFCC00),
      statusInfo: Color(0xFF0063F7),
      statusSuccess: Color(0xFF06C270),
      neutral: ColorsSet(
        tone0: Color(0xFF3A3A3C),
        tone10: Color(0xFF6B7588),
        tone20: Color(0xFF515960),
        tone30: Color(0xFF7D8388),
        tone40: Color(0xFFA8ACAF),
        tone50: Color(0xFFBEC1C4),
        tone60: Color(0xFFEAEBEC),
        tone70: Color(0xFFF4F4F5),
        tone80: Color(0xFFFFFFFF),
      ),
    );
  }

  @override
  ThemeExtension<BaseDesigns> copyWith({
    Color? mainColor,
    Color? mainDarker,
    Color? mainLighter,
    Color? mainSubtle,
    Color? secondaryColor,
    Color? secondaryDarker,
    Color? secondaryLighter,
    Color? secondarySubtle,
    Color? statusError,
    Color? statusWarning,
    Color? statusInfo,
    Color? statusSuccess,
    ColorsSet? neutral,
  }) {
    return BaseDesigns._(
      mainColor: mainColor ?? this.mainColor,
      mainDarker: mainDarker ?? this.mainDarker,
      mainLighter: mainLighter ?? this.mainLighter,
      mainSubtle: mainSubtle ?? this.mainSubtle,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondaryDarker: secondaryDarker ?? this.secondaryDarker,
      secondaryLighter: secondaryLighter ?? this.secondaryLighter,
      secondarySubtle: secondarySubtle ?? this.secondarySubtle,
      statusError: statusError ?? this.statusError,
      statusWarning: statusWarning ?? this.statusWarning,
      statusInfo: statusInfo ?? this.statusInfo,
      statusSuccess: statusSuccess ?? this.statusSuccess,
      neutral: neutral ?? this.neutral,
    );
  }

  @override
  ThemeExtension<BaseDesigns> lerp(
    covariant ThemeExtension<BaseDesigns>? other,
    double t,
  ) {
    if (other is! BaseDesigns) {
      return this;
    }
    return BaseDesigns._(
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      mainDarker: Color.lerp(mainDarker, other.mainDarker, t)!,
      mainLighter: Color.lerp(mainLighter, other.mainLighter, t)!,
      mainSubtle: Color.lerp(mainSubtle, other.mainSubtle, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      secondaryDarker: Color.lerp(secondaryDarker, other.secondaryDarker, t)!,
      secondaryLighter:
          Color.lerp(secondaryLighter, other.secondaryLighter, t)!,
      secondarySubtle: Color.lerp(secondarySubtle, other.secondarySubtle, t)!,
      statusError: Color.lerp(statusError, other.statusError, t)!,
      statusWarning: Color.lerp(statusWarning, other.statusWarning, t)!,
      statusInfo: Color.lerp(statusInfo, other.statusInfo, t)!,
      statusSuccess: Color.lerp(statusSuccess, other.statusSuccess, t)!,
      neutral: ColorsSet.lerp(neutral, other.neutral, t),
    );
  }
}

class ColorsSet {
  final Color tone0;
  final Color tone10;
  final Color tone20;
  final Color tone30;
  final Color tone40;
  final Color tone50;
  final Color tone60;
  final Color tone70;
  final Color tone80;

  static ColorsSet lerp(ColorsSet a, ColorsSet b, double t) {
    return ColorsSet(
      tone0: Color.lerp(a.tone0, b.tone0, t)!,
      tone10: Color.lerp(a.tone10, b.tone10, t)!,
      tone20: Color.lerp(a.tone20, b.tone20, t)!,
      tone30: Color.lerp(a.tone30, b.tone30, t)!,
      tone40: Color.lerp(a.tone40, b.tone40, t)!,
      tone50: Color.lerp(a.tone50, b.tone50, t)!,
      tone60: Color.lerp(a.tone60, b.tone60, t)!,
      tone70: Color.lerp(a.tone70, b.tone70, t)!,
      tone80: Color.lerp(a.tone80, b.tone80, t)!,
    );
  }

  const ColorsSet({
    this.tone0 = Colors.transparent,
    this.tone10 = Colors.transparent,
    this.tone20 = Colors.transparent,
    this.tone30 = Colors.transparent,
    this.tone40 = Colors.transparent,
    this.tone50 = Colors.transparent,
    this.tone60 = Colors.transparent,
    this.tone70 = Colors.transparent,
    this.tone80 = Colors.transparent,
  });
}
