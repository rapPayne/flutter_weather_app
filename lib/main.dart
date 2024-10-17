import 'package:flutter/material.dart';
import 'package:weather_app/app_theme.dart';
import 'package:weather_app/location.dart';
import 'package:weather_app/weather_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather forecast',
      theme: appTheme,
      routes: {
        '/': (_) => const Location(),
        '/forecast': (_) => const WeatherMain(),
      },
    );
  }
}
