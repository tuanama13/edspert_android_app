import 'dart:developer';
import 'dart:ffi';

import 'package:edspert_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class OptionListWidget extends StatefulWidget {
  final String selectedValue;
  final String result;
  final String titleValue;
  const OptionListWidget(
      {super.key,
      required this.result,
      required this.titleValue,
      required this.selectedValue});

  @override
  State<OptionListWidget> createState() => _OptionListWidgetState();
}

class _OptionListWidgetState extends State<OptionListWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorThemes.border),
        borderRadius: BorderRadius.circular(10),
        color: widget.result == widget.selectedValue
            ? ColorThemes.primary.withOpacity(0.80)
            : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Text(
              "${widget.result}. ",
              style: const TextStyle(color: Colors.black),
            ),
            HtmlWidget(
              widget.titleValue,
              textStyle: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
