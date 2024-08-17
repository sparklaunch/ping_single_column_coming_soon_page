import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ping_single_column_coming_soon_page/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: _buildTheme(Brightness.dark),
      home: const MainScreen(),
    ),
  );
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);
  return baseTheme.copyWith(
    textTheme: GoogleFonts.libreFranklinTextTheme(baseTheme.textTheme),
  );
}
