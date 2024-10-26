import 'package:flutter/material.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';

Widget buildLocationWidget() {
  return Row(
    children: [
      Image.asset('assets/location.png'),
      const SizedBox(width: 5), // Use SizedBox for spacing
      Text(
        'ABCD, New Delhi',
        style: customTextStyle(
          fontSize: 16,
          color: const Color(0xFF323232),
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(width: 10),
      Image.asset('assets/down_arrow.png'),
    ],
  );
}
