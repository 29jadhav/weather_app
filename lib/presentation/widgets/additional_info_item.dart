import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final String condition;
  final double value;
  final IconData icon;
  const AdditionalInfoItem(
      {super.key,
      required this.condition,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(condition),
        const SizedBox(
          height: 8,
        ),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
