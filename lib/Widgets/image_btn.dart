import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final bool havColor;

  const ImageButton(
      {super.key,
      required this.onPressed,
      required this.image,
      required this.havColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Container(
          padding: const EdgeInsets.only(top: 7.6, bottom: 7.6),
          decoration: BoxDecoration(
            color: havColor ? const Color(0xffF2F2F2) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            "",
            height: 24,
          ),
        ),
      ),
    );
  }
}
