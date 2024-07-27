import 'dart:async';
import 'package:dormease/helper/ui_elements.dart';
import 'package:dormease/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();
  late Timer timer;
  List<double> progressValues = [0.0, 0.0, 0.0, 0.0];
  int currentPage = 0;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        progressValues[currentPage] += 0.033;
        if (progressValues[currentPage] >= 1.0) {
          progressValues[currentPage] = 1.0;
          if (currentPage < 3) {
            currentPage++;
            pageController.animateToPage(
              currentPage,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
            );
          } else {
            timer.cancel();
          }
        }
      });
      pageController.addListener(onPageChanged);
    });
    super.initState();
  }

  void onPageChanged() {
    int newPage = pageController.page!.round();
    if (newPage != currentPage) {
      if (timer.isActive) {
        setState(() {
          progressValues[currentPage] = 0.0;
          currentPage = newPage;
          progressValues[currentPage] = 0.0;
        });
      } else {
        setState(() {
          for (int i = 0; i < progressValues.length; i++) {
            progressValues[i] = (i == newPage) ? 1.0 : 0.0;
          }
          currentPage = newPage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 16,
              top: 16,
              right: 16,
              bottom: 80,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        children: const <Widget>[
                          Page(label: "1"),
                          Page(label: "2"),
                          Page(label: "3"),
                          Page(label: "4"),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: 50.0,
                          height: 7.0,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(8),
                            value: progressValues[index],
                            backgroundColor: Colors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.black),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: ExpandedButton(
                  label: LocaleKeys.getStarted.tr(),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  isLoading: false),
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label,
          style: const TextStyle(color: Colors.white, fontSize: 50)),
    );
  }
}
