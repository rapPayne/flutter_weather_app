import 'package:flutter/material.dart';

class WindArrow extends StatelessWidget {
  const WindArrow({required this.speed, required this.direction, super.key});
  final String speed;
  final String direction;

  double convertDirectionToRadians(String direction) {
    const conversionMap = {
      "E": 3.14159,
      "ESE": 3.52557,
      "SE": 3.92699,
      "SSE": 4.31096,
      "S": 4.71239,
      "SSW": 5.19636,
      "SW": 5.49779,
      "WSW": 5.88686,
      "W": 0.0,
      "WNW": 0.383,
      "NW": 0.785398,
      "NNW": 1.16937,
      "N": 1.5708,
      "NNE": 1.98024,
      "NE": 2.35619,
      "ENE": 2.74017,
    };
    return conversionMap[direction] ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: convertDirectionToRadians(direction),
      child: const Icon(Icons.arrow_forward),
    );
  }
}
