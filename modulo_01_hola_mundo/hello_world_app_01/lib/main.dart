import 'package:flutter/material.dart';
import 'package:hello_world_app_01/presentation/screens/counter/counter_functions_screen.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,colorSchemeSeed: Colors.blue),
      home: CounterFunctionsScreen(),
    );
  }
}
