import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Redflag extends StatelessWidget {
  const Redflag({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 230,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            gradient: LinearGradient(colors: [
              Color(0xFF034EA2).withOpacity(0.5), // 50% opacity
              Color(0xFFFFFFFF).withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/redflag.svg",
                // Set size as needed
                height: 100,
                fit: BoxFit.contain,
              ),
              Text("Red Flag",
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
