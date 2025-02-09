import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF034da0).withAlpha(128), // 50% opacity
                  Color(0xFFFFFFFF).withAlpha(25), // 10% opacity// Darker Blue
                ],
                begin: Alignment.topCenter, // Start position
                end: Alignment.bottomCenter, // End position
              )),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/mes.svg",
                width: 100, // Set size as needed
                height: 100,
                fit: BoxFit.contain,
              ),
              Text("FeedBack",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  )),
            ],
          ))),
    );
  }
}
