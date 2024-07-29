import 'package:flutter/material.dart';

import '../style/pallet.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallet.background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: Pallet.background,
    primarySwatch: const MaterialColor(
      0xFFFF7717,
      <int, Color>{
        50: Color(0xFFffa84c),
        100: Color(0xFFFFA543),
        200: Color(0xFFFA9D37),
        300: Color(0xFFFA8D2D),
        400: Color(0xFFFF7717),
        500: Color(0xFFFF7717),
        600: Color(0xFFFF7717),
        700: Color(0xFFFF7717),
        800: Color(0xFFFF7717),
        900: Color(0xFFc54700),
      },
    ),
    primaryColor: Pallet.primary,
    fontFamily: 'Poppins',
    visualDensity: VisualDensity.standard,
    cardTheme: const CardTheme(shadowColor: Color(0x0c000000)),
    canvasColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
    ).copyWith(
      brightness: Brightness.light,
      primary: Pallet.primary,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallet.secondary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: const MaterialColor(
      0xFFFF7717,
      <int, Color>{
        50: Color(0xFFffa84c),
        100: Color(0xFFFFA543),
        200: Color(0xFFFA9D37),
        300: Color(0xFFFA8D2D),
        400: Color(0xFFFF7717),
        500: Color(0xFFFF7717),
        600: Color(0xFFFF7717),
        700: Color(0xFFFF7717),
        800: Color(0xFFFF7717),
        900: Color(0xFFc54700),
      },
    ),
    primaryColor: Pallet.primary,
    fontFamily: 'Poppins',
    visualDensity: VisualDensity.standard,
    cardTheme: const CardTheme(shadowColor: Color(0x0c000000)),
    canvasColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
      brightness: Brightness.dark,
    ).copyWith(
      primary: Pallet.primary,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}
