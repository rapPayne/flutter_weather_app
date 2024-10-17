import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter location ($latitude, $longitude)'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => setState(() {
              latitude = 34.1425;
              longitude = -118.2551;
            }),
            child: const Text("Glendale, CA"),
          ),
          TextButton(
            onPressed: () => setState(() {
              latitude = 28.538336;
              longitude = -81.379234;
            }),
            child: const Text("Orlando, FL"),
          ),
          TextButton(
            onPressed: () => setState(() {
              latitude = 42.3601;
              longitude = -71.0589;
            }),
            child: const Text("Boston, MA"),
          ),
          TextButton(
            onPressed: () => setState(() {
              latitude = 21.315603;
              longitude = -157.858093;
            }),
            child: const Text("Honolulu, HI"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/forecast',
            arguments: {'latitude': latitude, 'longitude': longitude}),
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
