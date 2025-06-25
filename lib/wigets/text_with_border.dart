import 'package:flutter/material.dart';

class TextWithBorder extends StatelessWidget {
  final String hintText;

   const TextWithBorder({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.black45,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),

    );
  }
}