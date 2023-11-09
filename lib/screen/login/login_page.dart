import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/screen/home_screen/home_screen_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorThemes.backgroundColor,
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset("assets/images/login_image.png"),
                const SizedBox(
                  height: 56,
                ),
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text(
                      "Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF6A7483)),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenPage(),
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/google_logo.png"),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text("Masuk Dengan Gogle"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/apple_logo.png"),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "Masuk Dengan Apple ID",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
