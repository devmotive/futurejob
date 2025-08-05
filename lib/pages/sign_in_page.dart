import 'package:flutter/material.dart';
import 'package:futurejob/generated/assets.dart';
import 'package:futurejob/theme.dart';
import 'package:futurejob/utils/validators.dart';
import 'package:futurejob/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Controllers for the email and password text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // GlobalKey for the form to enable validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controls when the form fields should autovalidate
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  // Dispose controllers when the widget is removed from the widget tree
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 40,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _illustration(),
              _signInForm(),
              _signInAndCreateAccountButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for displaying the header section
  Widget _header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign In',
            style: TextStyle(
              fontSize: 16,
              fontWeight: regular,
              color: kGreyColor,
            ),
          ),
          Text(
            'Build Your Career',
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

  // Widget for displaying the illustration image
  Widget _illustration() {
    return Center(
      child: Image.asset(
        Assets.assetsImageIllustration,
        height: 240,
        fit: BoxFit.cover,
      ),
    );
  }

  // Widget for the sign-in form including email and password fields
  Widget _signInForm() {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        spacing: 20,
        children: [
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
        ],
      ),
    );
  }

  // Widget for the "Sign In" and "Create New Account" buttons
  Widget _signInAndCreateAccountButtons() {
    return Column(
      spacing: 20,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _validateAndSignIn,
            style: ElevatedButton.styleFrom(backgroundColor: kIndigoColor),
            child: Text('Sign In', style: TextStyle(color: kWhiteColor)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              // TODO: Navigate to sign up page
            },
            child: Text(
              'Create New Account',
              style: TextStyle(color: kGreyColor),
            ),
          ),
        ),
      ],
    );
  }

  // Validates the form and attempts to sign in the user
  void _validateAndSignIn() {
    // Trigger validation for all form fields
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      // If form is not valid, set autovalidateMode to always to show errors
      setState(() => _autoValidateMode = AutovalidateMode.always);
      return;
    }

    // TODO: Implement actual sign-in logic here (e.g., API call)
    // If sign-in is successful, navigate to the home page
    // Navigator.pushNamedAndRemoveUntil( // Example navigation
    //   context,
    //   HomePage.routeName,
    //   (route) => false,
    // );
  }
}
