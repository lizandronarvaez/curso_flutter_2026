import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app04/presentation/providers/theme_provider.dart';

class UiControlsScreen extends ConsumerWidget {
  static String name = 'iu_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text("Controles UI"),
        actions: [
          IconButton(
            icon: Icon(
              !isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            onPressed: () =>
                ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
          ),
        ],
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation? selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Modo Developer"),
          subtitle: const Text("Pruebas desarrollo"),
          value: isDeveloper,
          onChanged: (value) => setState(() => isDeveloper = !isDeveloper),
        ),

        ExpansionTile(
          title: const Text("Vehículo de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = value;
              }),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text('Coche'),
                    subtitle: const Text("Viajar en coche"),
                    leading: Radio<Transportation>(value: Transportation.car),
                  ),
                  ListTile(
                    title: const Text('Avión'),
                    subtitle: const Text("Viajar en avión"),
                    leading: Radio<Transportation>(value: Transportation.plane),
                  ),
                  ListTile(
                    title: const Text('Submarino'),
                    subtitle: const Text("Viajar en submarino"),
                    leading: Radio<Transportation>(
                      value: Transportation.submarine,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text("¿Añadir desayuno?"),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("¿Añadir comida?"),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("¿Añadir cena?"),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
