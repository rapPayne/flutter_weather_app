import 'package:flutter/material.dart';

class WindArrow extends StatelessWidget {
  const WindArrow({required this.speed, required this.direction, super.key});
  final String speed;
  final String direction;

  double convertDirectionToRadians(String direction) {
    const conversionMap = {
      "E": 0.0,
      "SE": 0.785398,
      "S": 1.5708,
      "SW": 2.35619,
      "W": 3.14159,
      "NW": 3.92699,
      "N": 4.71239,
      "NE": 5.49779,
      "NNE": 0.392,
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
