import 'package:dormease/translations/locale_keys.g.dart';
import 'package:dormease/views/home/appbar_actions/options/edit_profile.dart';
import 'package:dormease/views/home/appbar_actions/options/help.dart';
import 'package:dormease/views/home/appbar_actions/options/logout.dart';
import 'package:dormease/views/home/appbar_actions/options/settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppbarActions extends StatelessWidget {
  const AppbarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: (value) {
        if (value == LocaleKeys.editProfile.tr()) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditProfile()));
        } else if (value == LocaleKeys.help.tr()) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Help()));
        } else if (value == LocaleKeys.settings.tr()) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Settings()));
        } else if (value == LocaleKeys.logout.tr()) {
          logout(context);
        }
      },
      itemBuilder: (BuildContext context) {
        return {
          LocaleKeys.editProfile.tr(),
          LocaleKeys.help.tr(),
          LocaleKeys.settings.tr(),
          LocaleKeys.logout.tr()
        }.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Row(
              children: [
                if (choice == LocaleKeys.editProfile.tr())
                  const Icon(Icons.edit_note),
                if (choice == LocaleKeys.help.tr())
                  const Icon(Icons.help_outline),
                if (choice == LocaleKeys.settings.tr())
                  const Icon(Icons.settings),
                if (choice == LocaleKeys.logout.tr()) const Icon(Icons.logout),
                const SizedBox(width: 8),
                Text(choice),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
