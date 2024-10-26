import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';

Widget buildSearchWidget(BuildContext context) {
  return Row(
    children: [
      Container(
        color: const Color(0xFFEEEEEE), // Corrected hex color format
        width: 272,
        height: 48,
        child: Padding(
          padding: padding10,
          child: Row(
            children: [
              Expanded(
                // Use Expanded to fill available space
                child: Text(
                  'Search for products/stores',
                  style: customTextStyle(
                    fontSize: 16,
                    color: const Color(0xFF969696),
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                ),
              ),
              Image.asset('assets/search.png'),
            ],
          ),
        ),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/notifications');
        },
        child: Image.asset('assets/notification.png')),
      kWidth12,
      Image.asset('assets/tag.png'),
    ],
  );
}
