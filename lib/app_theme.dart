import "package:flutter/material.dart";

ColorScheme _colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
TextTheme _textTheme = const TextTheme().copyWith();

AppBarTheme _appBarTheme = const AppBarTheme().copyWith(
  foregroundColor: _colorScheme.onTertiary,
  backgroundColor: _colorScheme.tertiary,
);
ThemeData appTheme = ThemeData(
  colorScheme: _colorScheme,
  textTheme: _textTheme,
  useMaterial3: true,
  appBarTheme: _appBarTheme,
);
