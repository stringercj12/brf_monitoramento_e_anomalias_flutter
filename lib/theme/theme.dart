import 'package:flutter/material.dart';

sealed class BrfMonitoramentoEAnomaliasTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(250, 255, 179, 0),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      elevation: 10,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(250, 26, 35, 16),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
