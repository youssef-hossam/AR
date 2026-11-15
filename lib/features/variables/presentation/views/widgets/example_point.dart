import 'package:flutter/material.dart';

class ExamplePoint extends StatelessWidget {
  const ExamplePoint(this.text, {super.key, this.bullet = '🟦'});

  final String text;
  final String bullet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bullet, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 18, height: 1.4)),
          ),
        ],
      ),
    );
  }
}
