import 'dart:developer';

import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/constants/styles.dart';
import 'package:edspert_app/model/register_request_model.dart';
import 'package:edspert_app/screen/home_screen/home_screen_page.dart';
import 'package:edspert_app/widgets/custome_options_list_widget.dart';
import 'package:edspert_app/widgets/options_list_widget.dart';
import 'package:flutter/material.dart';

const List<int> listKelas = <int>[10, 11, 12];
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("10"), value: "10"),
    const DropdownMenuItem(child: Text("11"), value: "11"),
    const DropdownMenuItem(child: Text("12"), value: "12"),
  ];
  return menuItems;
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _jenisKelamin = 'Laki-laki';
  String selectedKelas = "10";
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: ColorThemes.backgroundColor,
        appBar: AppBar(
          toolbarHeight: 110,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: const Text('Yuk Isi Data Diri'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Stack(
              children: [
                // EMAIL
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            decoration: StyleTheme.textFieldStyle.copyWith(
                              hintText: 'example@mail.com',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    // NAMA LENGKAP
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Lengkap',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            decoration: StyleTheme.textFieldStyle
                                .copyWith(hintText: 'contoh : Joko Susilo'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    // JENIS KELAMIN
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _jenisKelamin = 'Laki-laki';
                                    log(_jenisKelamin);
                                  });
                                },
                                child: CustomeOptionListWidget(
                                    selectedValue: _jenisKelamin,
                                    result: 'Laki-laki',
                                    titleValue: 'Laki-laki'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _jenisKelamin = 'Perempuan';
                                    log(_jenisKelamin);
                                  });
                                },
                                child: CustomeOptionListWidget(
                                    selectedValue: _jenisKelamin,
                                    result: 'Perempuan',
                                    titleValue: 'Perempuan'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 14,
                    ),
                    // PILIH KELAS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pilih Kelas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 60,
                          child: DropdownButtonFormField(
                            dropdownColor: Colors.white,
                            decoration: StyleTheme.dropdownFieldStyle,
                            items: dropdownItems,
                            value: selectedKelas,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    // NAMA SEKOLAH
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Sekolah',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            decoration: StyleTheme.textFieldStyle
                                .copyWith(hintText: 'contoh :  SMA Negeri 3'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: StyleTheme.primaryButtonRounded,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreenPage(),
                            ));
                      },
                      child: const Text('DAFTAR'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
