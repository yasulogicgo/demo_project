import 'package:demo_app/constant/app_constant.dart';
import 'package:logic_go_network/network/api_type.dart';

class ApiEndPoint {

// ---------- AUTH ----------
  static const String registerByEmail = "$baseUrlauth/auth/register-by-email";
  static const String loginByEmail = "$baseUrlauth/auth/login-by-email";
  static const String verifyEmailOtp = "$baseUrlauth/auth/verify-email-otp";
  static const String resendEmailOtp = "$baseUrlauth/auth/resend-email-otp";
  static const String forgotPassword = "$baseUrlauth/auth/forgot-password";
  static const String googleLogin = "$baseUrlauth/auth/google-login";
  static const String resetPassword = "$baseUrlauth/auth/reset-password";
  static const String verifyRecaptcha = "$baseUrlauth/auth/verify-recaptcha";
  static const String verifyToken = "$baseUrlauth/auth/verify/token";

// ---------- USER ----------
  static const String getProfile = "$baseUrlauth/user/profile";
  static const String updateProfile = "$baseUrlauth/user/update-profile";
}

Future<Map<String, String>> requestHeader(APIType apiType, {bool? passRefreshToken}) async {
   return {
     if (apiType == APIType.protected)
       RequestHeaderKey.authorization: "Bearer ",
   };
}


class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const authToken = "Auth-Token";
  static const authorization = "Authorization";
}
