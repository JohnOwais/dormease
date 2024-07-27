import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RoomsLayout extends StatefulWidget {
  const RoomsLayout({super.key});

  @override
  State<RoomsLayout> createState() => _RoomsLayoutState();
}

class _RoomsLayoutState extends State<RoomsLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.rooms.tr()));
  }
}
