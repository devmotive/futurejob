import 'package:flutter/material.dart';
import 'package:futurejob/pages/home_page.dart';
import 'package:futurejob/pages/sign_in_page.dart';
import 'package:futurejob/pages/sign_up_page.dart';
import 'package:futurejob/pages/splash_page.dart';
import 'package:futurejob/pages/started_page.dart';
import 'package:futurejob/providers/image_picker_provider.dart';
import 'package:futurejob/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ImagePickerProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: kIndigoColor),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: regular,
            color: kIndigoColor,
          ),
        ),
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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(overlayColor: Colors.transparent),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kLightGreyColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: kIndigoColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: kRedColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: kRedColor),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        StartedPage.routeName: (context) => StartedPage(),
        SignInPage.routeName: (context) => SignInPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
