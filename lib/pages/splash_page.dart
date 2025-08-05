import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
