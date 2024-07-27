// ignore_for_file: use_build_context_synchronously

import 'package:dormease/helper/functions.dart';
import 'package:dormease/helper/ui_elements.dart';
import 'package:dormease/providers/user_provider.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:dormease/views/home/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key, required this.phone});

  final String phone;

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  var nameValid = true;
  var emailValid = true;
  var addressValid = true;
  var cityValid = true;
  var stateValid = true;
  var countryValid = true;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 245),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/images/logo.png')),
            const SizedBox(width: 8),
            Text(LocaleKeys.businessInfo.tr()),
          ],
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Stack(children: [
        Positioned(
          left: 16,
          top: 16,
          right: 16,
          bottom: 80,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputText(
                    controller: nameController,
                    keyboard: TextInputType.text,
                    hint: LocaleKeys.businessName.tr(),
                    icon: Icons.business,
                    min: 5,
                    max: 25,
                    valid: nameValid,
                    error: LocaleKeys.error5character.tr(),
                    updateValid: (bool isValid) {
                      setState(() {
                        nameValid = isValid;
                      });
                    }),
                const SizedBox(height: 16),
                InputText(
                    controller: emailController,
                    keyboard: TextInputType.emailAddress,
                    hint: LocaleKeys.businessEmail.tr(),
                    icon: Icons.email,
                    min: 7,
                    max: 50,
                    valid: emailValid,
                    error: LocaleKeys.invalidEmail.tr(),
                    updateValid: (bool isValid) {
                      setState(() {
                        emailValid = isValid;
                      });
                    }),
                const SizedBox(height: 16),
                InputText(
                    controller: addressController,
                    keyboard: TextInputType.streetAddress,
                    hint: LocaleKeys.streetAddress.tr(),
                    icon: Icons.pin_drop_outlined,
                    min: 5,
                    max: 50,
                    valid: addressValid,
                    error: LocaleKeys.error5character.tr(),
                    updateValid: (bool isValid) {
                      setState(() {
                        addressValid = isValid;
                      });
                    }),
                const SizedBox(height: 16),
                InputText(
                    controller: cityController,
                    keyboard: TextInputType.text,
                    hint: LocaleKeys.city.tr(),
                    icon: Icons.location_city_rounded,
                    min: 1,
                    max: 30,
                    valid: cityValid,
                    error: LocaleKeys.validCityName.tr(),
                    updateValid: (bool isValid) {
                      setState(() {
                        cityValid = isValid;
                      });
                    }),
                const SizedBox(height: 16),
                InputText(
                    controller: stateController,
                    keyboard: TextInputType.text,
                    hint: LocaleKeys.stateUT.tr(),
                    icon: Icons.map,
                    min: 3,
                    max: 30,
                    valid: stateValid,
                    error: LocaleKeys.error3character.tr(),
                    updateValid: (bool isValid) {
                      setState(() {
                        stateValid = isValid;
                      });
                    }),
                const SizedBox(height: 16),
                InputText(
                    controller: countryController,
                    keyboard: TextInputType.text,
                    hint: LocaleKeys.country.tr(),
                    icon: Icons.public,
                    min: 4,
                    max: 30,
                    valid: countryValid,
                    error: LocaleKeys.error4character.tr(),
                    updateValid: (bool isValid) {
                      setState(() {
                        countryValid = isValid;
                      });
                    }),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: ExpandedButton(
              label: LocaleKeys.submit.tr(),
              onPressed: () async {
                final businessName = nameController.text.trim();
                final businessEmail = emailController.text.trim();
                final address = addressController.text.trim();
                final city = cityController.text.trim();
                final state = stateController.text.trim();
                final country = countryController.text.trim();
                if (businessName.length < 5) {
                  setState(() {
                    nameValid = false;
                  });
                } else if (!isValidEmail(businessEmail)) {
                  setState(() {
                    emailValid = false;
                  });
                } else if (address.length < 5) {
                  setState(() {
                    addressValid = false;
                  });
                } else if (city.isEmpty) {
                  setState(() {
                    cityValid = false;
                  });
                } else if (state.length < 3) {
                  setState(() {
                    stateValid = false;
                  });
                } else if (country.length < 4) {
                  setState(() {
                    countryValid = false;
                  });
                } else {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  context.read<UserProvider>().updateBusinessDetails(
                      phone: widget.phone,
                      logo: "null",
                      businessName: businessName,
                      businessEmail: businessEmail,
                      address: address,
                      city: city,
                      state: state,
                      country: country);
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              phone: widget.phone,
                              name: businessName,
                              email: businessEmail)),
                      (route) => false);
                }
              },
              isLoading: isLoading),
        )
      ]),
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
      child: Row(
        children: [
          Text(text,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
