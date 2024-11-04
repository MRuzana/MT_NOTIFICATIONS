import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';

class AllStoreButton extends StatelessWidget {
  const AllStoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding15,
      child: Center(
        child: Container(
          height: 40,
          width: 240,
          decoration: BoxDecoration(
              color: const Color(0xFF29D177),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text('View all stores',
                style: customTextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}