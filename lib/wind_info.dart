import 'package:flutter/material.dart';
import 'package:weather_app/wind_arrow.dart';
import 'package:weather_app/wind_speed.dart';

class WindInfo extends StatelessWidget {
  const WindInfo({required this.speed, required this.direction, super.key});
  final String speed;
  final String direction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            WindSpeed(maxSpeed: parseMaxSpeed(speed)),
            WindArrow(direction: direction),
          ],
        ),
        Text("Wind: $speed from $direction"),
      ],
    );
  }

  int parseMaxSpeed(String speedString) {
    // Remove the " mph" suffix for easier parsing
    String cleanedString = speedString.replaceAll(' mph', '').trim();

    if (cleanedString.contains('to')) {
      // Split the range by "to"
      List<String> range = cleanedString.split('to');

      // Parse the minimum and maximum values
      int minValue = int.parse(range[0].trim());
      int maxValue = int.parse(range[1].trim());

      // Return the maximum value of the range
      return maxValue;
    } else {
      // If it's a single value, just parse and return it
      return int.parse(cleanedString);
    }
  }
}
