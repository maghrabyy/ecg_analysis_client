import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Light grey background
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1976D2), // Medical blue
    foregroundColor: Colors.white, // AppBar title/icons color
    elevation: 0,
    centerTitle: true,
  ),
);
