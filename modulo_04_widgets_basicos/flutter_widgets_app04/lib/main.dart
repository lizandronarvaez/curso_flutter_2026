import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app04/config/router/app_router.dart';
import 'package:flutter_widgets_app04/presentation/providers/theme_provider.dart';
import 'config/theme/app_theme.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedColor = ref.watch(selectedColorProvider);
    // final isDarkMode = ref.watch(isDarkModeProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      // declaracion de app router
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'APP FLUTTER 2026 - LIZANDRO NARVAEZ',
      theme: appTheme.getTheme(),

      // declaracion de rutas de la aplicación manualmente
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },
    );
  }
}
