class AppConstants {
  // API Constants
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';

  // Error Messages
  static const String serverFailureMessage = 'Server Failure';
  static const String cacheFailureMessage = 'Cache Failure';
  static const String networkFailureMessage = 'Network Failure';
  static const String authFailureMessage = 'Authentication Failure';
  static const String validationFailureMessage = 'Validation Failure';

  // Success Messages
  static const String successMessage = 'Operation completed successfully';
  static const String loginSuccessMessage = 'Login successful';
  static const String signupSuccessMessage = 'Account created successfully';

  // Validation Messages
  static const String emailRequiredMessage = 'Email is required';
  static const String passwordRequiredMessage = 'Password is required';
  static const String invalidEmailMessage = 'Invalid email format';
  static const String shortPasswordMessage =
      'Password must be at least 6 characters';

  // Regex Patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 800);

  // Spacing
  static const double smallSpacing = 8.0;
  static const double mediumSpacing = 16.0;
  static const double largeSpacing = 24.0;
  static const double extraLargeSpacing = 32.0;

  // Border Radius
  static const double smallRadius = 4.0;
  static const double mediumRadius = 8.0;
  static const double largeRadius = 12.0;
  static const double extraLargeRadius = 16.0;
}
