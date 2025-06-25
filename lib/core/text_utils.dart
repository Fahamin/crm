import 'package:flutter/material.dart';

Widget textNormal(String value, Color color, double size) {
  return Text(value,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontFamily: "Poppins", fontSize: size));
}

Widget textNormalStart(String value, Color color, double size) {
  return Text(value,
      style: TextStyle(color: color, fontFamily: "Poppins", fontSize: size));
}

Widget spaceHeight(var value) {
  return SizedBox(height: value);
}

Widget spaceWidth(var value) {
  return SizedBox(width: value);
}

Widget horizontalList(var list, {required Function(String) onItemPressed}) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => onItemPressed(list[index]),
          child: Text(list[index]),
        ),
      );
    },
  );
}
