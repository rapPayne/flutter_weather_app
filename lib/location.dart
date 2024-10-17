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
