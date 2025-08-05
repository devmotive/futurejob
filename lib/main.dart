import 'package:flutter/material.dart';
import 'package:futurejob/pages/started_page.dart';
import 'package:futurejob/pages/splash_page.dart';
import 'package:futurejob/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            overlayColor: Colors.transparent,
            textStyle: TextStyle(fontSize: 14, fontWeight: medium),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(66),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            overlayColor: Colors.transparent,
            textStyle: TextStyle(fontSize: 14, fontWeight: medium),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(66),
            ),
            side: BorderSide(width: 1),
          ),
        ),
      ),
      routes: {
        '/': (context) => SplashPage(),
        '/started': (context) => StartedPage(),
      },
    );
  }
}
