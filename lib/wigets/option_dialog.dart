import 'dart:ui';

import 'package:crm/core/colors.dart';
import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationDialog extends StatelessWidget {
  final VoidCallback onJournal;
  final VoidCallback onAnatomy;

  const InformationDialog({
    super.key,
    required this.onJournal,
    required this.onAnatomy,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Dialog(
      backgroundColor: cardbg,
      child: SizedBox(
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                // Transparent with opacity
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textNormal("Select Option", Colors.white, 14.0),
                  spaceHeight(9.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Get.back();
                          onJournal();
                        },
                        icon: Icon(Icons.book, color: Colors.green),
                        label: SizedBox(
                          width: 65,
                          child: Text(
                            "Journal",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green.shade100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(width: 16),
                      // NO Button
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onAnatomy();
                        },
                        icon: Icon(Icons.man, color: Colors.red),
                        label: SizedBox(
                          width: 65,
                          child: Text(
                            "Anatomy",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red.shade100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
