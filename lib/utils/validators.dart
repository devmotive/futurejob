// lib/utils/validators.dart

/// Validates an email address.
///
/// Returns an error message if the email is invalid, otherwise returns null.
String? validateEmail(String? value) {
  // Check if the value is null or empty.
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  // Define a regular expression for a valid email format.
  // TODO: Consider using a more robust email validation library for comprehensive checks.
  final emailRegex = RegExp(r'\S+@\S+\.\S+');
  // Check if the value matches the email regex.
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  // Return null if the email is valid.
  return null;
}

/// Validates a password.
///
/// Returns an error message if the password is invalid, otherwise returns null.
String? validatePassword(String? value) {
  // Check if the value is null or empty.
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  // Check if the password length is at least 6 characters.
  // TODO: Implement more complex password validation rules (e.g., uppercase, lowercase, numbers, special characters).
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  // Return null if the password is valid.
  return null;
}
