import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contador infinito"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              counter <= 1 ? 'Click' : 'Clicks',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          customActionButton(
            icon: Icons.refresh_rounded,
            onPressed: () {
              counter = 0;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          customActionButton(
            icon: Icons.plus_one,
            onPressed: () {
              counter++;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          customActionButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              if (counter == 0) return;
              counter--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  // boton generico para reutilizar el componente
  FloatingActionButton customActionButton({
    IconData? icon,
    VoidCallback? onPressed,
  }) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      elevation: 0,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
