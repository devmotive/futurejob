import 'package:flutter/material.dart';
import 'package:futurejob/theme.dart';

class JobTile extends StatelessWidget {
  const JobTile({
    super.key,
    required this.imageUrl,
    required this.jobTitle,
    required this.companyName,
  });

  // The URL of the image to display for the job.
  final String imageUrl;

  // The title of the job.
  final String jobTitle;

  // The name of the company offering the job.
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      // Leading widget is displayed at the beginning of the ListTile.
      // TODO: Add error handling for image loading (e.g., placeholder or error widget).
      leading: Image.asset(imageUrl, height: 45, fit: BoxFit.cover),
      // Title is the primary content of the ListTile.
      title: Text(
        jobTitle,
        style: TextStyle(fontSize: 16, fontWeight: medium, color: kBlackColor),
      ),
      // Subtitle is displayed below the title.
      subtitle: Text(
        companyName,
        style: TextStyle(fontSize: 14, fontWeight: regular, color: kGreyColor),
      ),
    );
  }
}
