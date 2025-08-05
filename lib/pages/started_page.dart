import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  static const routeName = '/started';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            Assets.assetsImageBackgroundSignIn,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Text content
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            children: [
              Text(
                'Build Your Next\n'
                'Future Career Like\n'
                'a Master',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: regular,
                  color: kWhiteColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '18,000 jobs available',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: light,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),

          // Buttons aligned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: kIndigoColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: kWhiteColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: kWhiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
