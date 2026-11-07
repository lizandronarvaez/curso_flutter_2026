import 'package:go_router/go_router.dart';
import 'package:modulo_05_app_cinemapedia/presentation/screens/movies/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
