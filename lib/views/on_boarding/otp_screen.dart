// ignore_for_file: use_build_context_synchronously

import 'package:dormease/helper/ui_elements.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'business_details.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phone});

  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 245),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/images/logo.png', height: 150, width: 150),
              Text(LocaleKeys.verificationCode.tr(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              Text(LocaleKeys.verificationDesc.tr(),
                  style: const TextStyle(color: Colors.grey, fontSize: 13)),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(widget.phone,
                    style: const TextStyle(fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputBox(
                        controller: controller1,
                        currentFocus: focus1,
                        nextFocus: focus2),
                    InputBox(
                        controller: controller2,
                        currentFocus: focus2,
                        nextFocus: focus3),
                    InputBox(
                        controller: controller3,
                        currentFocus: focus3,
                        nextFocus: focus4),
                    InputBox(
                        controller: controller4,
                        currentFocus: focus4,
                        nextFocus: focus4),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ExpandedButton(
                    label: LocaleKeys.verifyOtp.tr(),
                    onPressed: () async {
                      final otp = controller1.text +
                          controller2.text +
                          controller3.text +
                          controller4.text;
                      if (otp.length < 4) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(LocaleKeys.pleaseEnterValidOtp.tr(),
                                style: const TextStyle(color: Colors.white)),
                            backgroundColor: Colors.red));
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                              children: [
                                Text(LocaleKeys.verificationSuccess.tr(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(width: 8),
                                const Icon(Icons.done_all, color: Colors.white)
                              ],
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2)));
                        await Future.delayed(
                            const Duration(milliseconds: 2500));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BusinessDetails(phone: widget.phone)),
                            (route) => false);
                      }
                    },
                    isLoading: isLoading),
              ),
              const SizedBox(height: 16),
              Text(LocaleKeys.resendOtp.tr(),
                  style: const TextStyle(
                      fontSize: 17, decoration: TextDecoration.underline))
            ]),
          ),
        ));
  }
}

class InputBox extends StatelessWidget {
  const InputBox(
      {super.key,
      required this.controller,
      required this.currentFocus,
      required this.nextFocus});

  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode nextFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500),
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        onChanged: (value) {
          if (value.length == 1) {
            if (currentFocus != nextFocus) {
              nextFocus.requestFocus();
            } else {
              currentFocus.unfocus();
            }
          }
        },
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
