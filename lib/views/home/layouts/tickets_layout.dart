import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TicketsLayout extends StatefulWidget {
  const TicketsLayout({super.key});

  @override
  State<TicketsLayout> createState() => _TicketsLayoutState();
}

class _TicketsLayoutState extends State<TicketsLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.tickets.tr()));
  }
}
