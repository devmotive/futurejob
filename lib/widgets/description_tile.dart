import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';

class DescriptionTile extends StatelessWidget {
  const DescriptionTile({super.key, required this.description});

  /// The text content of the description item.
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        // The leading dot icon.
        Image.asset(Assets.assetsIconDot, height: 12),
        // Ensures the text takes up the remaining available space.
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: light,
              color: kBlackColor,
            ),
          ),
        ),
      ],
    );
  }
}
