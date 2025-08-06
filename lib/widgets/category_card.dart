import 'package:flutter/material.dart';
import 'package:futurejob/theme.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.title, required this.imageUrl});

  // The title of the category.
  final String title;
  // The URL or asset path of the category image.
  // TODO: Consider using NetworkImage for network URLs if applicable.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // Stack to layer the image and the title.
      child: Stack(
        children: [
          // Container for the category image.
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            // Image widget to display the category image.
            // TODO: Add error handling for image loading (e.g., placeholder or error widget).
            child: Image.asset(imageUrl),
          ),
          // Align widget to position the title at the bottom left.
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: medium,
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
