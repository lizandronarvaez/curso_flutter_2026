import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo_05_app_cinemapedia/infraestructure/datasource/moviedb_datasource.dart';
import 'package:modulo_05_app_cinemapedia/infraestructure/repositories/movie_repository_impl.dart';

//Repositorio inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
