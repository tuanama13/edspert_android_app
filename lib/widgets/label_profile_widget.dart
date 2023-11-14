import 'package:edspert_app/constants/colors.dart';
import 'package:flutter/material.dart';

class LabelProfileWidget extends StatelessWidget {
  final String label;
  final String value;

  const LabelProfileWidget(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: ColorThemes.textSubtitle1, fontSize: 12),
        ),
        Text(
          value,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
