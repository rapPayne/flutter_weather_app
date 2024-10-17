import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/weather_card.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({super.key});

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  late double? latitude;
  late double? longitude;
  List<Map<String, dynamic>> forecasts = [];

  @override
  void didChangeDependencies() {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    var latlon = (arguments ?? {'latitude': 34.14, 'longitude': -118.25})
        as Map<String, double?>;
    latitude = latlon['latitude'];
    longitude = latlon['longitude'];

    String url = 'https://api.weather.gov/points/$latitude,$longitude';
    get(Uri.parse(url))
        .then((res) => json.decode(res.body))
        .then((res) => get(Uri.parse(res['properties']['forecast'])))
        .then((res) => json.decode(res.body))
        .then((res) => res['properties']['periods'] as List<dynamic>)
        .then((res) => res.map((r) => r as Map<String, dynamic>).toList())
        .then((p) => setState(() => forecasts = p));
    /*
    Other than "today", each day is 2 periods: 6am-6pm and 6pm-6am next day
    periods: [
    Each  period has a name, number, temp, precip %, windspeed, winddirection, icon, 
    ]
    */
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forecast"),
      ),
      body: ListView(
        children: forecasts.map((f) {
          return WeatherCard(f);
        }).toList(),
      ),
    );
  }
}
