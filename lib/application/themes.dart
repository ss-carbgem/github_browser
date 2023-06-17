import 'package:flutter/material.dart';

const kBrandColor = Color.fromARGB(0xFF, 0x27, 0x4D, 0x96);

final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: textTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kBrandColor,
    ));

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ),
  brightness: Brightness.dark,
  textTheme: textTheme,
);

const textTheme = TextTheme(
  // Display
  displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300),
  displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w400),
  displaySmall: TextStyle(fontSize: 48),

  // headline
  headlineLarge:
      TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: kBrandColor),
  headlineMedium:
      TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: kBrandColor),
  headlineSmall: TextStyle(fontSize: 24),

  // title
  titleLarge:
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: kBrandColor),
  titleMedium:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: kBrandColor),
  titleSmall: TextStyle(
    fontSize: 16,
  ),

  // Body
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  bodySmall: TextStyle(fontSize: 14),

  // Label
  labelLarge:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBrandColor),
  labelMedium:
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kBrandColor),
  labelSmall: TextStyle(fontSize: 12),
  // → Chips 　に使用されている
);
