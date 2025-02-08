// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_bloc_clean/config/color/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text(title)),
        ));
  }
}
