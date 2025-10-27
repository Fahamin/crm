import 'package:flutter/material.dart';

class Infobank extends StatelessWidget {
  const Infobank({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 230,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF874295).withAlpha(128), // 50% opacity
                  Color(0xFFFFFFFF).withAlpha(25), // 10% opacity// Darker Blue
                ],
                begin: Alignment.topRight, // Start position
                end: Alignment.bottomLeft, // End position
              )),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/infoi.png",
                height: 100,
                fit: BoxFit.contain,
              ),
              Text("Information Bank",
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
