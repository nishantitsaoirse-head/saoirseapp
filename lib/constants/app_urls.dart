// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

class AppURLs {
  //base api
  static String BASE_API = 'http://localhost:3000/';

  //login api
  static String SIGNIN_API = BASE_API + '';
  static String getRefferal_API = BASE_API + "api/referrals/generate-code";
  static String getDashboard_API = BASE_API + "api/referrals/dashboard?userId=";
}
