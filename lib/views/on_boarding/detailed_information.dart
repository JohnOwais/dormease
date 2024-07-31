// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:dormease/helper/ui_elements.dart';
import 'package:dormease/providers/user_provider.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:dormease/views/home/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailedInformation extends StatefulWidget {
  const DetailedInformation(
      {super.key,
      required this.phone,
      required this.imagePath,
      required this.businessName,
      required this.businessEmail,
      required this.address,
      required this.city,
      required this.state,
      required this.country});

  final String phone;
  final String imagePath;
  final String businessName;
  final String businessEmail;
  final String address;
  final String city;
  final String state;
  final String country;

  @override
  State<DetailedInformation> createState() => _DetailedInformationState();
}

class _DetailedInformationState extends State<DetailedInformation> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                    child: widget.imagePath == "null"
                        ? Image.asset('assets/images/logo.png')
                        : Image.file(File(widget.imagePath)))),
            const SizedBox(width: 8),
            Text(widget.businessName.length <= 20
                ? widget.businessName
                : widget.businessName.substring(0, 20)),
          ],
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Stack(
        children: [
          const Positioned(
              left: 16,
              top: 16,
              right: 16,
              bottom: 80,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Future Use",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(height: 16),
                    Text(
                        "This page is kept for filling detailed information of business which will be required for functioning of all modules. For now, please skip this page and submit your details. Thanks.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey))
                  ])),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ExpandedButton(
                label: LocaleKeys.submit.tr(),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  context.read<UserProvider>().updateBusinessDetails(
                      phone: widget.phone,
                      logoUrl: widget.imagePath,
                      businessName: widget.businessName,
                      businessEmail: widget.businessEmail,
                      address: widget.address,
                      city: widget.city,
                      state: widget.state,
                      country: widget.country);
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false);
                },
                isLoading: isLoading),
          )
        ],
      ),
    );
  }
}
