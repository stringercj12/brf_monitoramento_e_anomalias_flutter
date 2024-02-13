import 'package:flutter/material.dart';

sealed class ColorsConstants {
  static const primary = MaterialColor(
    primaryBlue,
    <int, Color>{
      100: Color(0xffCBDDFF),
      200: Color(0xff659CFF),
      300: Color(primaryBlue),
      400: Color(0xff005AFE),
      500: Color(0xff002465),
      600: Color(0xff002465),
      700: Color(0xff001232),
    },
  );
  static const int primaryBlue = 0xFF003087;
}
