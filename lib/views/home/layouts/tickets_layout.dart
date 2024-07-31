import 'package:dormease/helper/ui_elements.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TicketsLayout extends StatefulWidget {
  const TicketsLayout({super.key});

  @override
  State<TicketsLayout> createState() => _TicketsLayoutState();
}

class _TicketsLayoutState extends State<TicketsLayout> {
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
              itemCount: 7,
              itemBuilder: (context, index) {
                return const Ticket();
              })),
    ]);
  }
}

class Ticket extends StatelessWidget {
  const Ticket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("# 1234",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: Text(LocaleKeys.closed.tr(),
                            style: const TextStyle(color: Colors.white)),
                      )),
                  const SizedBox(width: 8),
                  const Icon(Icons.more_vert)
                ],
              ),
              const Text("19-Aug-2024"),
              const Row(
                children: [
                  Text("Raised by: "),
                  Text("Owais Yosuf",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.w500)),
                ],
              ),
              Divider(color: Colors.grey[100]),
              Row(
                children: [
                  Text(LocaleKeys.issue.tr()),
                  const Text("Washing Machine",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                  "Washing machine is not working and its motor also making noise which disturbs us while studying.",
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ));
  }
}
