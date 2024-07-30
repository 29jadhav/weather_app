import 'package:flutter/material.dart';

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final double temprature;
  const WeatherForecastCard(
      {super.key,
      required this.time,
      required this.temprature,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 24,
            ),
            const SizedBox(
              height: 8,
            ),
            Text("$temprature"),
          ],
        ),
      ),
    );
  }
}
