// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart'
    show Brightness, Color, Colors, ThemeData;

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      // no hace falta mucho pero para seguir el curso, ya viene por defecto
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[this.selectedColor],
      // brightness: Brightness.dark
    );
  }
}
