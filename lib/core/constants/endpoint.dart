class EndPoints {
  // Update these empty endpoints with actual paths
  static const appVersion = 'app/version';
  static const fcmToken =
      'users/fcm-token'; // Updated from empty string to actual endpoint
  static const clearFcmToken =
      'users/fcm-token/clear'; // Updated from empty string to actual endpoint

  /////////////// March 2025 ///////////////
  static const login = 'auth/signin';
  static const signup = 'auth/signup';
  static const refreshToken = 'auth/token/refresh';
  static const forgotPasswordVerifyOtp = 'auth/password-reset/otp/verify';
  static const forgotPassword = 'auth/password-reset/otp/initiate';
  static const resetPassword = 'auth/password-reset/otp/reset';
  static const emailVerify = 'auth/email/verify';
  static const signOut = 'auth/signout';

  static const deleteAccount = 'auth/account/delete';

  ///// OTP verification ///////
  static const otpSend = 'auth/verification/send';
  static const verifyOtp = 'auth/verification/verify';

  static const resendOtpForSignup = 'auth/verification/resend';

  static const resendOtpForForgotPassword = 'auth/password-reset/otp/resend';

  ///////// Profile ////////////////
  static const userProfile = 'users/profile';
  static const updateProfile = 'users/profile';
}
