import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';
import 'package:futurejob/widgets/description_tile.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /// A boolean flag to track whether the user has applied for the job.
  bool _isApplied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
          child: Column(
            spacing: 30,
            children: [_header(), _content(), _applyButton(context)],
          ),
        ),
      ),
    );
  }

  /// Builds the header section of the detail page, displaying the company logo and job title.
  Widget _header() {
    return Column(
      spacing: 20,
      children: [
        Container(
          margin: EdgeInsets.only(top: 45),
          alignment: Alignment.center,
          // TODO: Replace with actual company logo based on job data.
          child: Image.asset(
            Assets.assetsIconGoogle,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          spacing: 2,
          children: [
            // TODO: Replace with actual job title based on job data.
            Text(
              'Front-End Developer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: semiBold,
                color: kBlackColor,
              ),
            ),
            Text(
              // TODO: Replace with actual company name and location based on job data.
              'Google, Inc • Jakarta',
              style: TextStyle(
                fontSize: 14,
                fontWeight: regular,
                color: kGreyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Builds the content section of the detail page, displaying job details like 'About', 'Qualifications', and 'Responsibilities'.
  Widget _content() {
    return Column(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: Populate 'About the job' section with actual data.
        _section(
          title: 'About the job',
          descriptions: ['Full-Time On Site', 'Start at \$18,000 per month'],
        ),
        _section(
          title: 'Qualifications',
          descriptions: [
            // TODO: Populate 'Qualifications' section with actual data.
            'Candidate must possess at least a Bachelor\'s Degree',
            'Able to use Microsoft Office and Google based service',
            'Have an excellent time management, good at organized and details',
          ],
        ),
        _section(
          title: 'Responsibilities',
          descriptions: [
            // TODO: Populate 'Responsibilities' section with actual data.
            'Initiate and promote any programs, events, training, or activities.',
            'Assessing and anticipating needs and collaborate with Division.',
          ],
        ),
      ],
    );
  }

  /// Builds a section with a title and a list of descriptions.
  Widget _section({required String title, required List<String> descriptions}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: medium,
            color: kBlackColor,
          ),
        ),
        SizedBox(height: 16),
        ...descriptions.map(
          (description) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DescriptionTile(description: description),
          ),
        ),
      ],
    );
  }

  /// Builds the apply button and message recruiter button.
  Widget _applyButton(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Container(
          width: 200,
          height: 45,
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              // Toggles the applied state or shows a snackbar if applying for the first time.
              if (_isApplied) {
                // TODO: Implement actual job application cancellation logic.
                setState(() => _isApplied = !_isApplied);
              } else {
                _showSnackBar(context);
                // TODO: Implement actual job application logic.
              }
            },
            style: ElevatedButton.styleFrom(
              // Changes button color based on the applied state.
              backgroundColor: _isApplied ? kRedColor : kIndigoColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66),
              ),
            ),
            child: Text(
              _isApplied ? 'Cancel Job' : 'Apply for Job',
              // TODO: Consider localizing button text.
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        ),
        TextButton(
          // TODO: Implement navigation or action for 'Message Recruiter'.
          onPressed: () {},
          child: Text('Message Recruiter', style: TextStyle(color: kGreyColor)),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context) {
    setState(() => _isApplied = !_isApplied);
    // Displays a snackbar message confirming the job application.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'You have applied this job and the recruiter will contact you',
          // TODO: Consider localizing snackbar message.
          style: TextStyle(
            fontSize: 14,
            fontWeight: regular,
            color: kGreyColor,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xffECEDF1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(48),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        margin: EdgeInsets.all(24),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
    );
  }
}
