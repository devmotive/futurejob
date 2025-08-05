import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurejob/pages/home_page.dart';
import 'package:futurejob/providers/image_picker_provider.dart';
import 'package:futurejob/theme.dart';
import 'package:futurejob/utils/validators.dart';
import 'package:futurejob/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers for the email and password text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  // GlobalKey for the form to enable validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controls when the form fields should autovalidate
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  // Dispose controllers when the widget is removed from the widget tree
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _profileImagePicker(),
              _signUpForm(),
              _signUpAndSignInButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for displaying the header section
  Widget _header() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 16,
              fontWeight: regular,
              color: kGreyColor,
            ),
          ),
          Text(
            'Begin New Journey',
            style: TextStyle(
              fontSize: 24,
              fontWeight: semiBold,
              color: kBlackColor,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for displaying the profile image picker
  Widget _profileImagePicker() {
    // Access the ImagePickerProvider to get the selected image
    final imageProvider = context.watch<ImagePickerProvider>();
    final File? pickedImage = imageProvider.selectedImage;

    return Center(
      child: GestureDetector(
        // Trigger image picking from gallery on tap
        onTap: () => context.read<ImagePickerProvider>().pickImageFromGallery(),
        child: Container(
          width: 120,
          height: 120,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 50),
          // Decorate the container as a circle with a border
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kIndigoColor),
          ),
          // Clip the child to an oval shape to maintain the circular appearance
          child: ClipOval(
            // Conditionally display the picked image or a placeholder icon
            child: pickedImage != null
                ? Image.file(pickedImage, fit: BoxFit.cover)
                : Container(
                    color: kLightGreyColor,
                    child: Icon(Icons.cloud_upload_outlined),
                  ),
            // TODO: Add a loading indicator while the image is being picked.
          ),
        ),
      ),
    );
  }

  // Widget for the sign-up form including name, email, password, and goal fields
  Widget _signUpForm() {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Column(
          spacing: 20,
          children: [
            CustomTextField(
              title: 'Full Name',
              controller: _nameController,
              validator: (value) => validateGenericField(value, 'Full Name'),
            ),
            CustomTextField(
              title: 'Email Address',
              controller: _emailController,
              validator: validateEmail,
            ),
            CustomTextField(
              title: 'Password',
              controller: _passwordController,
              validator: validatePassword,
            ),
            CustomTextField(
              title: 'Your Goal',
              controller: _goalController,
              validator: (value) => validateGenericField(value, 'Your Goal'),
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "Sign Up" and "Back to Sign In" buttons
  Widget _signUpAndSignInButtons() {
    return Column(
      spacing: 20,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _validateAndSignUp,
            style: ElevatedButton.styleFrom(backgroundColor: kIndigoColor),
            child: Text('Sign Up', style: TextStyle(color: kWhiteColor)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              // TODO: Navigate to sign up page
            },
            child: Text('Back to Sign In', style: TextStyle(color: kGreyColor)),
          ),
        ),
      ],
    );
  }

  // Validates the form and the picked image, then navigates to the home page if valid.
  void _validateAndSignUp() {
    // Validate the form fields using the form key.
    final isValid = _formKey.currentState!.validate();
    // Get the picked image from the ImagePickerProvider.
    final pickedImage = context.read<ImagePickerProvider>().selectedImage;

    // If the form is not valid, enable autovalidation and return.
    if (!isValid) {
      setState(() => _autoValidateMode = AutovalidateMode.always);
      return;
    }

    // If no image is picked, show a SnackBar and return.
    if (pickedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a profile image'),
          backgroundColor: kRedColor,
          // Makes the SnackBar float above the bottom navigation bar (if any).
          behavior: SnackBarBehavior.floating,
          // TODO: Consider adding an action to the SnackBar to allow users to pick an image directly.
        ),
      );
      return;
    }

    // TODO: Implement the actual sign-up logic (e.g., API call) if the form is valid.
    Navigator.pushNamedAndRemoveUntil<void>(
      context,
      HomePage.routeName,
      // Remove all previous routes from the stack.
      (route) => false,
    );
  }
}
