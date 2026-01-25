class InputValidator {
  ///  Password
  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password must not be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must have at least one special character';
    }

    return null;
  }

  ///  Phone
  static String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number must not be empty';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number must contain digits only';
    } else if (value.length < 10) {
      return 'Phone number is too short';
    } else if (value.length > 15) {
      return 'Phone number is too long';
    }

    return null;
  }

  /// Email
  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email must not be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Confirm Password
  static String? confirmPasswordValidator(
    String? value,
    String currentPassword,
  ) {
    if (value == null || value.isEmpty) {
      return 'Confirm password must not be empty';
    } else if (value != currentPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  ///  Name
  static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name must not be empty';
    } else if (value.length < 2) {
      return 'Name is too short';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name must contain letters only';
    }

    return null;
  }
}
