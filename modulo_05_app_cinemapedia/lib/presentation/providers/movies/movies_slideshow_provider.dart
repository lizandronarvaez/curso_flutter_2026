import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:modulo_05_app_cinemapedia/domain/entities/movie.dart';

import '../../../config/constants/number_constants.dart';
import 'movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingProvider);

  if (nowPlayingMovies.isEmpty) {
    return List.empty();
  }

  return nowPlayingMovies.sublist(
    NumberConstants.NUMBER_0,
    NumberConstants.NUMBER_6,
  );
});
