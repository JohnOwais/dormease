import 'package:dormease/helper/ui_elements.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RoomsLayout extends StatefulWidget {
  const RoomsLayout({super.key});

  @override
  State<RoomsLayout> createState() => _RoomsLayoutState();
}

class _RoomsLayoutState extends State<RoomsLayout> {
  final searchController = TextEditingController();
  var filterText = "";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
        child: Row(
          children: [
            Expanded(
              child: SearchBox(
                  controller: searchController,
                  filterText: filterText,
                  updateFilterText: (String updatedText) {
                    setState(() {
                      filterText = updatedText;
                    });
                  }),
            ),
            const SizedBox(width: 12),
            Button(
                label: LocaleKeys.addRoom.tr(),
                onPressed: () {},
                isLoading: false)
          ],
        ),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Room();
              })),
    ]);
  }
}

class Room extends StatelessWidget {
  const Room({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(32)),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.door_back_door, color: Colors.white),
                    )),
                const SizedBox(width: 12),
                const Text("Room 101",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
                const Spacer(),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Text(LocaleKeys.available.tr(),
                          style: const TextStyle(color: Colors.white)),
                    )),
                const SizedBox(width: 8),
                const Icon(Icons.more_vert)
              ],
            ),
            Divider(color: Colors.grey[100], height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.bed, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(LocaleKeys.beds.tr(),
                        style: const TextStyle(color: Colors.black54)),
                    const SizedBox(width: 4),
                    const Text("4",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                    const Spacer(),
                    const Row(
                      children: [
                        Icon(Icons.bed, color: Colors.green),
                        Icon(Icons.bed, color: Colors.red),
                        Icon(Icons.bed, color: Colors.red),
                        Icon(Icons.bed, color: Colors.red)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.notes, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(LocaleKeys.underNotice.tr(),
                        style: const TextStyle(color: Colors.black54)),
                    const SizedBox(width: 4),
                    const Text("1",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 17,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(LocaleKeys.rentDue.tr(),
                        style: const TextStyle(color: Colors.black54)),
                    const SizedBox(width: 4),
                    const Text("2",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 17,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.airplane_ticket, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(LocaleKeys.activeTickets.tr(),
                        style: const TextStyle(color: Colors.black54)),
                    const SizedBox(width: 4),
                    const Text("1",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 17,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
