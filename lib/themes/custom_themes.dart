import 'package:flutter/material.dart';

class CustomThemes {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Colors.pink,
    onPrimary: Colors.white,
    secondary: Colors.pink,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color.fromARGB(239, 248, 152, 152),
    onSurface: Colors.black,
    brightness: Brightness.light,
    surfaceContainer: Colors.white,
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color.fromARGB(255, 20, 57, 122),
    secondary: Color.fromARGB(255, 20, 57, 122),
    surface: Color.fromARGB(255, 36, 73, 135),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
    surfaceContainer: Color.fromARGB(255, 16, 45, 95),
  );

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: lightColorScheme.primary,
    shadowColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    scrolledUnderElevation: 10.0,
    toolbarHeight: 72.0,
    titleTextStyle: TextStyle(
        color: lightColorScheme.onPrimary,
        fontSize: 20.0,
        fontWeight: FontWeight.normal),
// round corners
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    ),
// icons button theme
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 16.0),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    shadowColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    scrolledUnderElevation: 10.0,
    toolbarHeight: 72.0,
    titleTextStyle: TextStyle(
        color: darkColorScheme.onPrimary,
        fontSize: 20.0,
        fontWeight: FontWeight.normal),
// round corners
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    ),
// icons button theme
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 16.0),
  );

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        fontFamily: "Poppins",
        colorScheme: colorScheme,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        appBarTheme: (colorScheme == lightColorScheme
            ? lightAppBarTheme
            : darkAppBarTheme));
  }

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);
}
