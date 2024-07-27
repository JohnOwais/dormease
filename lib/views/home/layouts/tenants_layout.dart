import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TenantsLayout extends StatefulWidget {
  const TenantsLayout({super.key});

  @override
  State<TenantsLayout> createState() => _TenantsLayoutState();
}

class _TenantsLayoutState extends State<TenantsLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.tenants.tr()));
  }
}
