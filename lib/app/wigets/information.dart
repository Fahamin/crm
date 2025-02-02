import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage("assets/images/redbg.png"), // Local asset image
              fit: BoxFit.cover, // Covers the entire container
            ),
          ),
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
