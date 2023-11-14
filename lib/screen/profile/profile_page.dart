import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/widgets/label_profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorThemes.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: Container(
            decoration: BoxDecoration(
              color: ColorThemes.primary,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: ColorThemes.primary,
                  title: const Text(
                    'Akun Saya',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                  centerTitle: true,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fajrin Arrahman",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "SMAN 1 Kediri",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    "https://cdn.iconscout.com/icon/free/png-512/avatar-370-456322.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Identitas Diri",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LabelProfileWidget(
                      label: 'Nama Lengkap',
                      value: 'Muhammad Ali Topan',
                    ),
                    LabelProfileWidget(
                      label: 'Email',
                      value: 'helloaltop@gmail.com',
                    ),
                    LabelProfileWidget(
                      label: 'Jenis Kelamin',
                      value: 'Laki-laki',
                    ),
                    LabelProfileWidget(
                      label: 'Kelas',
                      value: 'XII-IPA',
                    ),
                    LabelProfileWidget(
                      label: 'Sekolah',
                      value: 'SMAN 1 Kediri',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextButton.icon(
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text('Keluar'),
                ),
              ),
            ],
          ),
        ));
  }
}
