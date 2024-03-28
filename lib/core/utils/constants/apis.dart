class Api {
// https://development.hamropahal.org/api/auth
  // static final String baseUrl = "https://development.hamropahal.org";
  // static final String imageUrl =

  static final String baseUrl = "https://3b05-27-34-108-2.ngrok-free.app";

  static const String prefix = "/api/v1";
  static const String auth = "/auth";
// auth
  static final String signupUrl = "$baseUrl$prefix$auth/register";

  static final String loginUrl = "$baseUrl$prefix$auth/login";
  static final String forgotPassword = "$baseUrl$prefix$auth/forgot-password";
  static final String verifyOTP = "$baseUrl$prefix$auth/verify-otp";
  static final String resetPassword = "$baseUrl$prefix$auth/reset-password";
  static final String changePw = "$baseUrl$prefix$auth/change-password";
}
