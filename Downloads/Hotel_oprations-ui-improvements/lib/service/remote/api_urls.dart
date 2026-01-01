// import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  // static const String _baseUrl = "https://api.roboti.app";
  // static const String _baseUrl = "http://robitibackendv2-env.eba-btujbc8b.us-east-1.elasticbeanstalk.com";
  // static const String _baseUrl = "http://robitibackendv2-env.eba-btujbc8b.us-east-1.elasticbeanstalk.com";
  // static const String _baseUrl = "http://new-robitibackend-env.eba-ymbmaa7z.us-east-1.elasticbeanstalk.com";
  // static const String _baseUrl =
  //     "http://robitibackend-env-withlb.eba-ymbmaa7z.us-east-1.elasticbeanstalk.com";

  static const String _baseUrl = "https://api.roboti.app";
  // "https://robitibackend-env-withlb.eba-ymbmaa7z.us-east-1.elasticbeanstalk.com";

  static String get getBaseUrlForImages => "$_baseUrl/";

  static const String _userBaseUrl = "$_baseUrl/user";

  // Auth Endpoints
  static const String googleLoginUrl = "$_userBaseUrl/googleLogin";
  static const String manualLoginUrl = "$_userBaseUrl/login";
  static const String signupUrl = "$_userBaseUrl/signUp";
  static const String singupOtpVerificationUrl =
      "$_userBaseUrl/signip_otp_verification";
  static const String sentOtpUrl = "$_userBaseUrl/send_otp";
  static const String forgotPasswordUrl = "$_userBaseUrl/forgot_password";
  static const String deleteAccountUrl = "$_userBaseUrl/deleteUser";
  static const String forgotPasswordOtpVerificationUrl =
      "$_userBaseUrl/forgot_password_otp";
  static const String resetPasswordUrl = "$_userBaseUrl/reset_password";
  static const String appleLoginUrl = "$_userBaseUrl/appleLogin";

  // Categories Endpoints
  static const String categoriesUrl = "$_userBaseUrl/getcategory";

  // Tasks Endpoints
  static const String tasksUrl = "$_userBaseUrl/getTask";

  // Fields Endpoints
  static const String fieldsUrl = "$_userBaseUrl/getField";

  static const String chatCompletionOpenAIUrl =
      "https://api.openai.com/v1/chat/completions";
  

  static const String googleTranslationUrl =
      "https://translation.googleapis.com/language/translate/v2";
}

class ApiKeys {
  // static var googleApiKey = dotenv.env['googleApiKey'];
  static var googleApiKey = "";
  static var openAiKey = "";
}
