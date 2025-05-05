import 'package:flutter/material.dart';

Widget numberedStep(String number, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('🔹 $number.', style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, height: 1.4),
          ),
        ),
      ],
    ),
  );
}
