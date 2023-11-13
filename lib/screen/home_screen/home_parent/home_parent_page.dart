import 'dart:developer';

import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/screen/diskusi_soal/diskusi_soal_page.dart';
import 'package:edspert_app/screen/home_screen/home_screen_page.dart';
import 'package:edspert_app/screen/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomeParentPage extends StatefulWidget {
  const HomeParentPage({super.key});

  @override
  State<HomeParentPage> createState() => _HomeParentPageState();
}

class _HomeParentPageState extends State<HomeParentPage> {
  int pageIndex = 0;

  final pages = [
    const HomeScreenPage(),
    const DiskusiSoalPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorThemes.primary,
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: "Diskusi Soal",
              icon: Icon(Icons.check_circle_sharp),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_pin),
            ),
          ],
        ));
  }
}
