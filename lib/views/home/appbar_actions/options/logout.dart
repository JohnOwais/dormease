import 'package:dormease/translations/locale_keys.g.dart';
import 'package:dormease/views/on_boarding/login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void logout(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                const Icon(Icons.logout),
                const SizedBox(width: 16),
                Text(LocaleKeys.logout.tr()),
              ],
            ),
            content: Text(LocaleKeys.sureToLogout.tr()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(LocaleKeys.no.tr(),
                      style: const TextStyle(color: Colors.black))),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                        (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                          children: [
                            Text(LocaleKeys.logoutSuccess.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 8),
                            const Icon(Icons.done_all, color: Colors.white)
                          ],
                        ),
                        backgroundColor: Colors.green));
                  },
                  child: Text(LocaleKeys.yes.tr(),
                      style: const TextStyle(color: Colors.black)))
            ],
          ));
}
