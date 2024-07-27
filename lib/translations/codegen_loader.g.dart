// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "DormEase",
  "getStarted": "Get Started",
  "welcomeText": "Welcome To DormEase",
  "optMessage": "We will send you an OTP to verify your number",
  "enterPhoneNo": "Enter phone no.",
  "invalidPhoneNo": "Invalid phone number",
  "requestOtp": "Request OTP",
  "verificationCode": "Verification Code",
  "verificationDesc": "We sent you an OTP to your number",
  "pleaseEnterValidOtp": "Please enter valid OTP",
  "verificationSuccess": "Verification Success",
  "verifyOtp": "Verify OTP",
  "resendOtp": "Resend OTP",
  "businessInfo": "Business Information",
  "businessName": "Business Name",
  "error3character": "Can't be less than 3 characters",
  "error4character": "Can't be less than 4 characters",
  "error5character": "Can't be less than 5 characters",
  "businessEmail": "Business Email",
  "invalidEmail": "Invalid email",
  "streetAddress": "Street Address",
  "city": "City",
  "validCityName": "Please enter valid city name",
  "stateUT": "State / UT",
  "country": "Country",
  "submit": "Submit",
  "dashboard": "Dashboard",
  "rooms": "Rooms",
  "tenants": "Tenants",
  "tickets": "Tickets",
  "editProfile": "Edit Profile",
  "help": "Help",
  "settings": "Settings",
  "logout": "Logout",
  "revenue": "REVENUE",
  "fromLastMonth": "From last month",
  "rentDetails": "Rent Details",
  "paid": "Paid",
  "notPaid": "Not Paid",
  "remindToPay": "REMIND TO PAY",
  "stats": "Stats",
  "vacantBeds": "Vacant Beds",
  "total": "Total",
  "noticePeriod": "Notice Period",
  "sureToLogout": "Sure to logout?",
  "logoutSuccess": "Successfully Logged Out",
  "yes": "Yes",
  "no": "No"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
