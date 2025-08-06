import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';
import 'package:futurejob/widgets/job_tile.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  static const routeName = '/category';

  // TODO: Refactor _jobPostings to be dynamic based on the selected category.
  // Currently, it displays the same job postings for all categories.
  // Consider passing category-specific data or fetching it based on a category ID.
  final List<JobTile> _jobPostings = [
    // TODO: Fetch recent job postings from a data source (e.g., API) instead of hardcoding.
    // This list is currently static and should be replaced with data fetched
    // from a backend or local database.
    JobTile(
      imageUrl: Assets.assetsIconGoogle,
      jobTitle: 'Front-End Developer',
      companyName: 'Google',
    ),
    JobTile(
      imageUrl: Assets.assetsIconInstagram,
      jobTitle: 'UI Designer',
      companyName: 'Instagram',
    ),
    JobTile(
      imageUrl: Assets.assetsIconFacebook,
      jobTitle: 'Data Scientist',
      companyName: 'Facebook',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            children: [
              _buildCategoryHeader(),
              _buildJobPostingList('Big Companies'),
              _buildJobPostingList('New Startups'),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header section of the category page.
  /// It displays an image and text related to the category.
  Widget _buildCategoryHeader() {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.vertical(
              bottom: Radius.circular(16),
            ),
            child: Image.asset(
              Assets.assetsImageCategories,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            // TODO: Extract magic numbers (16, 2) into named constants for better readability
            // and maintainability, e.g., `kDefaultPadding`, `kSmallSpacing`.
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // TODO: Make the category title dynamic.
                    // This should ideally come from the category data.
                    'Website Developer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: semiBold,
                      color: kWhiteColor,
                    ),
                  ),
                  Text(
                    // TODO: Make the available job count dynamic.
                    // This should reflect the actual number of jobs in this category.
                    '12,309 available',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: regular,
                      color: kWhiteColor,
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

  /// Builds a list of job postings for a given [title].
  /// This widget displays a title and a list of [JobTile] widgets.
  Widget _buildJobPostingList(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: regular,
              color: kBlackColor,
            ),
          ),
          ListView.separated(
            // Prevents the ListView from scrolling independently,
            // allowing the SingleChildScrollView to handle all scrolling.
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _jobPostings.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => _jobPostings[index],
          ),
        ],
      ),
    );
  }
}
