import 'package:dormease/helper/ui_elements.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TenantsLayout extends StatefulWidget {
  const TenantsLayout({super.key});

  @override
  State<TenantsLayout> createState() => _TenantsLayoutState();
}

class _TenantsLayoutState extends State<TenantsLayout> {
  final searchController = TextEditingController();
  var filterText = "";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
        child: SearchBox(
            controller: searchController,
            filterText: filterText,
            updateFilterText: (String updatedText) {
              setState(() {
                filterText = updatedText;
              });
            }),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Tenant();
              })),
    ]);
  }
}

class Tenant extends StatelessWidget {
  const Tenant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/dp.png',
                  height: 120,
                  width: 120,
                ),
              ),
              Positioned(
                left: 135,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Owais Yosuf",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
                      child: Container(
                        color: Colors.grey[100],
                        height: 1,
                        width: 150,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.door_back_door,
                          color: Colors.black54,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(LocaleKeys.roomNo.tr(),
                            style: const TextStyle(color: Colors.black54)),
                        const SizedBox(width: 4),
                        const Text("101",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.notes,
                          color: Colors.black54,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(LocaleKeys.underNotice.tr(),
                            style: const TextStyle(color: Colors.black54)),
                        const SizedBox(width: 4),
                        const Text("Yes",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.black54,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(LocaleKeys.rentDue.tr(),
                            style: const TextStyle(color: Colors.black54)),
                        const SizedBox(width: 4),
                        const Text("No",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Colors.black54,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(LocaleKeys.joined.tr(),
                            style: const TextStyle(color: Colors.black54)),
                        const SizedBox(width: 4),
                        const Text("23-Sept-2024",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
              const Positioned(right: 0, child: Icon(Icons.more_vert))
            ],
          ),
        ));
  }
}
