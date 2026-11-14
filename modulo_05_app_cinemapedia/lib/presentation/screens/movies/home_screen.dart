import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movies/movies_providers.dart';
import '../../providers/movies/movies_slideshow_provider.dart';
import '../../widgets/movies/movies_slideshow.dart';
import '../../widgets/shared/custom_appbar.dart';
import '../../widgets/shared/custom_botton_navigation.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    if (moviesSlideshow.isEmpty) return CircularProgressIndicator();
    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideshow(movies: moviesSlideshow),
      ],
    );
  }
}
