import 'dart:ui';

import 'package:crm/core/colors.dart';
import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onYes;
  final VoidCallback onNo;

  const ConfirmationDialog({
    super.key,
    required this.onYes,
    required this.onNo,
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
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                // Transparent with opacity
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textNormal(
                      "Are you sure you want to proceed?", Colors.white, 14.0),
                  spaceHeight(4.0),
                  textNormal(
                      "This action cannot be undone.", Colors.white, 12.0),
                  spaceHeight(6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onYes();
                        },
                        icon: Icon(Icons.check_circle, color: Colors.green),
                        label: SizedBox(
                          width: 50,
                          child: Text(
                            "Yes",
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
                          onNo();
                        },
                        icon: Icon(Icons.cancel, color: Colors.red),
                        label: SizedBox(
                          width: 50,
                          child: Text(
                            "No",
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
