import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        RevenueCard(widget: widget),
        const SizedBox(height: 8),
        RentDetails(widget: widget),
        const SizedBox(height: 8),
        Stats(widget: widget)
      ]),
    );
  }
}

class RevenueCard extends StatelessWidget {
  const RevenueCard({
    super.key,
    required this.widget,
  });

  final HomeLayout widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border.all(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(LocaleKeys.revenue.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Row(
                          children: [
                            Text(widget.data['dateRange']),
                            const SizedBox(width: 8),
                            const Icon(Icons.date_range, size: 20)
                          ],
                        ),
                      ))
                ],
              ),
              Text("₹ ${widget.data['revenue']}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text("${widget.data['percentage']}%",
                  style: const TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w500)),
              Text(LocaleKeys.fromLastMonth.tr(),
                  style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
        ));
  }
}

class RentDetails extends StatelessWidget {
  const RentDetails({
    super.key,
    required this.widget,
  });

  final HomeLayout widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5, color: Colors.cyan),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(LocaleKeys.rentDetails.tr(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: PieChart(PieChartData(
                      centerSpaceRadius: 30,
                      sections: [
                        PieChartSectionData(
                            value: widget.data['paidRentPercentage'],
                            color: Colors.cyan,
                            radius: 30,
                            title: "${widget.data['paidRentPercentage']}%",
                            titleStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                        PieChartSectionData(
                            value: 100.0 - widget.data['paidRentPercentage'],
                            color: Colors.grey[300],
                            radius: 30,
                            title:
                                "${100.0 - widget.data['paidRentPercentage']}%",
                            titleStyle: const TextStyle(
                                color: Colors.cyan,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ],
                    )),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      border: Border.all(width: 1)),
                                ),
                                const SizedBox(width: 8),
                                Text(LocaleKeys.paid.tr(),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border: Border.all(width: 1)),
                                ),
                                const SizedBox(width: 8),
                                Text(LocaleKeys.notPaid.tr(),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            border: Border.all(width: 1, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                          child: Row(
                            children: [
                              Image.asset('assets/images/whatsapp.png',
                                  height: 20, width: 20),
                              const SizedBox(width: 8),
                              Text(LocaleKeys.remindToPay.tr(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class Stats extends StatelessWidget {
  const Stats({super.key, required this.widget});

  final HomeLayout widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5, color: Colors.cyan),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Text(LocaleKeys.stats.tr(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(LocaleKeys.vacantBeds.tr(),
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 17)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.data['vacantBeds'].toString(),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            const Text(" / ",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            Text(widget.data['totalBeds'].toString(),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Text(LocaleKeys.tenants.tr(),
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 17)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(LocaleKeys.total.tr(),
                                    style: const TextStyle(
                                        color: Colors.cyan,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                Text(widget.data['totalTenant'].toString(),
                                    style: const TextStyle(
                                        color: Colors.cyan,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Column(
                              children: [
                                Text(LocaleKeys.noticePeriod.tr(),
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                Text(widget.data['noticePeroid'].toString(),
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
