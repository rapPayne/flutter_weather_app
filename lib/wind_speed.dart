import 'package:flutter/material.dart';

class WindSpeed extends StatelessWidget {
  const WindSpeed({required this.maxSpeed, super.key});
  final int maxSpeed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildIcons(),
    );
  }

  List<Widget> _buildIcons() {
    List<Widget> icons = [];
    for (int i = 0; i < _numberOfIcons(); i++) {
      Icon icon = const Icon(Icons.air);
      icons.add(icon);
    }
    return icons;
  }

  int _numberOfIcons() {
    // I don't know that these thresholds are quite right yet...
    if (maxSpeed >= 30) {
      return 4;
    } else if (maxSpeed >= 20) {
      return 3;
    } else if (maxSpeed >= 10) {
      return 2;
    } else {
      return 1;
    }
  }
}
