import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> _colors = [
  Colors.blue,
  Colors.teal,
  Colors.yellow,
  Colors.green,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor <= _colors.length - 1,
        'Ese color no está dentro de la lista ${_colors.length}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colors[selectedColor],
    );
  }
}
