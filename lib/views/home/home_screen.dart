import 'dart:io';
import 'package:dormease/providers/user_provider.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appbar_actions/actions.dart';
import 'layouts/home_layout.dart';
import 'layouts/rooms_layout.dart';
import 'layouts/tenants_layout.dart';
import 'layouts/tickets_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map<String, dynamic> data;
  var selectedTab = LocaleKeys.dashboard.tr();
  var isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      data = {
        'revenue': 52365,
        'dateRange': '01/08/24 - 31/08/24',
        'percentage': '+ 0.6',
        'paidRentPercentage': 70.0,
        'vacantBeds': 12,
        'totalBeds': 150,
        'totalTenant': 138,
        'noticePeroid': 5
      };
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 245),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                    child: context.watch<UserProvider>().userData['logoUrl'] ==
                            "null"
                        ? Image.asset('assets/images/logo.png')
                        : Image.file(File(context
                            .watch<UserProvider>()
                            .userData['logoUrl'])))),
            const SizedBox(width: 16),
            Text(
                context.watch<UserProvider>().userData['businessName'].length <=
                        20
                    ? context.watch<UserProvider>().userData['businessName']
                    : context
                        .watch<UserProvider>()
                        .userData['businessName']
                        .substring(0, 20)),
          ],
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: const [
          AppbarActions(),
        ],
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Positioned(
                  left: 8,
                  top: 8,
                  right: 8,
                  bottom: 90,
                  child: Builder(builder: (context) {
                    if (selectedTab == LocaleKeys.dashboard.tr()) {
                      return HomeLayout(data: data);
                    } else if (selectedTab == LocaleKeys.rooms.tr()) {
                      return const RoomsLayout();
                    } else if (selectedTab == LocaleKeys.tenants.tr()) {
                      return const TenantsLayout();
                    } else if (selectedTab == LocaleKeys.tickets.tr()) {
                      return const TicketsLayout();
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
          Toolbar(
              selectedTab: selectedTab,
              updateTab: (String tab) {
                setState(() {
                  selectedTab = tab;
                });
              }),
        ],
      ),
    );
  }
}

class Toolbar extends StatelessWidget {
  const Toolbar(
      {super.key, required this.selectedTab, required this.updateTab});

  final String selectedTab;
  final Function(String) updateTab;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black87, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    updateTab(LocaleKeys.dashboard.tr());
                  },
                  child: TabOption(
                      icon: Icons.bar_chart,
                      label: LocaleKeys.dashboard.tr(),
                      selectedTab: selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    updateTab(LocaleKeys.rooms.tr());
                  },
                  child: TabOption(
                      icon: Icons.door_back_door,
                      label: LocaleKeys.rooms.tr(),
                      selectedTab: selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    updateTab(LocaleKeys.tenants.tr());
                  },
                  child: TabOption(
                      icon: Icons.person,
                      label: LocaleKeys.tenants.tr(),
                      selectedTab: selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    updateTab(LocaleKeys.tickets.tr());
                  },
                  child: TabOption(
                      icon: Icons.airplane_ticket,
                      label: LocaleKeys.tickets.tr(),
                      selectedTab: selectedTab),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class TabOption extends StatelessWidget {
  const TabOption(
      {super.key,
      required this.icon,
      required this.label,
      required this.selectedTab});

  final IconData icon;
  final String label;
  final String selectedTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
            color: label == selectedTab ? Colors.amberAccent : Colors.white70),
        Text(label,
            style: TextStyle(
                color:
                    label == selectedTab ? Colors.amberAccent : Colors.white70,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
