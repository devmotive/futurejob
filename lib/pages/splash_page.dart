import 'dart:async';

import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/started',
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kIndigoColor,
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.assetsIconLogo, height: 76, fit: BoxFit.cover),
            Text(
              'FUTUREJOB',
              style: TextStyle(
                fontSize: 32,
                fontWeight: semiBold,
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
