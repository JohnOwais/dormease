import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userData = {};

  void updateBusinessDetails(
      {required String phone,
      required String logo,
      required String businessName,
      required String businessEmail,
      required String address,
      required String city,
      required String state,
      required String country}) {
    userData['phone'] = phone;
    userData['logo'] = logo;
    userData['businessName'] = businessName;
    userData['businessEmail'] = businessEmail;
    userData['address'] = address;
    userData['city'] = city;
    userData['state'] = state;
    userData['country'] = country;
    notifyListeners();
  }
}
