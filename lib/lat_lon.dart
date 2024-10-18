import 'package:flutter/material.dart';

class LatLon extends StatelessWidget {
  const LatLon(
      {super.key,
      required this.lat,
      required this.lon,
      required this.setLatLon});
  final void Function({double? lat, double? lon}) setLatLon;
  final double? lat;
  final double? lon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: lat.toString(),
          decoration: const InputDecoration(labelText: "Latitude"),
          onChanged: (val) => setLatLon(lat: double.parse(val)),
        ),
        TextFormField(
          initialValue: lon.toString(),
          decoration: const InputDecoration(labelText: "Longitude"),
          onChanged: (val) => setLatLon(lon: double.parse(val)),
        ),
      ],
    );
  }
}
