import 'package:edspert_app/constants/colors.dart';
import 'package:flutter/material.dart';

class BubbleChatWidget extends StatelessWidget {
  final String direction;
  const BubbleChatWidget({super.key, this.direction = 'left'});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: direction == 'left'
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Text(
          "Tutor Arin",
          style: TextStyle(color: Colors.amber[800]),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            if (direction == 'right') ...[
              const SizedBox(
                width: 50,
              ),
            ],
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amber[300],
                  borderRadius: direction == 'left'
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                ),
                child: const Text(
                    "Halo, Perkenalkan saya Arin yang akan menjadi pembimbing kalian di grub ini."),
              ),
            ),
            if (direction == 'left') ...[
              const SizedBox(
                width: 50,
              ),
            ],
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          "29m",
          style: TextStyle(color: ColorThemes.textSubtitle1, fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
