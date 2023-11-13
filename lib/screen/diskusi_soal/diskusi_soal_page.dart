import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/constants/styles.dart';
import 'package:edspert_app/widgets/bubble_chat_widget.dart';
import 'package:flutter/material.dart';

class DiskusiSoalPage extends StatelessWidget {
  const DiskusiSoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorThemes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorThemes.primary,
          title: const Text(
            'Diskusi Soal',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Stack(children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Column(
                children: [
                  BubbleChatWidget(),
                  BubbleChatWidget(
                    direction: 'right',
                  ),
                  BubbleChatWidget(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                ColorThemes.backgroundColorButton),
                          ),
                          icon: Icon(
                            Icons.add,
                            color: ColorThemes.primary,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 0),
                                filled: true,
                                fillColor: ColorThemes.backgroundColorButton,
                                focusColor: ColorThemes.primary,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                hintText: 'Ketuk Untuk Menulis.....',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send,
                              color: ColorThemes.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ]),
        ));
  }
}
