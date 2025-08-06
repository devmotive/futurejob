import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';
import 'package:futurejob/widgets/category_card.dart';
import 'package:futurejob/widgets/job_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const routeName = '/home';

  // Data for job categories.
  final List<CategoryCard> _jobCategories = [
    // TODO: Fetch job categories from a data source (e.g., API) instead of hardcoding.
    CategoryCard(
      title: 'Website\nDeveloper',
      imageUrl: Assets.assetsImageCardCategory1,
    ),
    CategoryCard(
      title: 'Mobile\nDeveloper',
      imageUrl: Assets.assetsImageCardCategory2,
    ),
    CategoryCard(
      title: 'App\nDesigner',
      imageUrl: Assets.assetsImageCardCategory3,
    ),
    CategoryCard(
      title: 'Content\nWriter',
      imageUrl: Assets.assetsImageCardCategory4,
    ),
    CategoryCard(
      title: 'Video\nGraper',
      imageUrl: Assets.assetsImageCardCategory5,
    ),
  ];

  // Data for recent job postings.
  final List<JobTile> _recentJobPostings = [
    // TODO: Fetch recent job postings from a data source (e.g., API) instead of hardcoding.
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
          padding: EdgeInsets.only(top: 30),
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_header(), _jobCategorySection(), _recentJobsSection()],
          ),
        ),
      ),
    );
  }

  /// Builds the header section of the HomePage.
  /// Displays a greeting and the user's profile picture.
  Widget _header() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            // TODO: Replace 'Howdy' and 'Jason Powell' with dynamic user data.
            children: [
              Text(
                'Howdy',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: regular,
                  color: kGreyColor,
                ),
              ),
              Text(
                'Jason Powell',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: semiBold,
                  color: kBlackColor,
                ),
              ),
            ],
          ),
          // Container for the user's profile picture.
          Container(
            width: 58,
            height: 58,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kIndigoColor),
            ),
            // TODO: Use a placeholder image if the user's image is not available.
            child: ClipOval(
              child: Image.asset(Assets.assetsImageUser, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the job category section of the HomePage.
  /// Displays a list of job categories in a horizontal ListView.
  Widget _jobCategorySection() {
    return Container(
      margin: EdgeInsets.only(left: 24),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for the job category section.
          Text(
            'Hot Categories',
            style: TextStyle(
              fontSize: 16,
              fontWeight: regular,
              color: kBlackColor,
            ),
          ),
          // Horizontal ListView for job categories.
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _jobCategories.length,
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                // Add padding to the right of the last item to ensure consistent spacing.
                if (index == _jobCategories.length - 1) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: _jobCategories[index],
                  );
                } else {
                  return _jobCategories[index];
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the recent jobs section of the HomePage.
  /// Displays a list of recent job postings in a vertical ListView.
  Widget _recentJobsSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for the recent jobs section.
          Text(
            'Just Posted',
            style: TextStyle(
              fontSize: 16,
              fontWeight: regular,
              color: kBlackColor,
            ),
          ),
          // Vertical ListView for recent job postings.
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _recentJobPostings.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, index) => _recentJobPostings[index],
          ),
        ],
      ),
    );
  }
}
