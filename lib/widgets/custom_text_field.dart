import 'package:flutter/material.dart';
import 'package:futurejob/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
  });

  // The title of the text field.
  final String title;

  // The controller for managing the text field's content.
  final TextEditingController controller;

  // The validator for the text field.
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text widget to display the title.
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: regular,
              color: kGreyColor,
            ),
          ),
          // TextFormField widget for user input.
          TextFormField(
            validator: validator,
            controller: controller,
            obscureText: title.toLowerCase().contains('password'),
            keyboardType: title.toLowerCase().contains('email')
                ? TextInputType.emailAddress
                : title.toLowerCase().contains('password')
                ? TextInputType.visiblePassword
                // Default keyboard type if not email or password.
                : TextInputType.name,
          ),
        ],
      ),
    );
  }
}
