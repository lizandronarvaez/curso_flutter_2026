import 'package:dio/dio.dart';
import 'package:modulo_05_app_cinemapedia/config/constants/environment.dart';
import 'package:modulo_05_app_cinemapedia/config/constants/moviedb_constants.dart';
import 'package:modulo_05_app_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:modulo_05_app_cinemapedia/domain/entities/movie.dart';

import '../models/moviedb/movie_moviedb.dart';

class MoviedbDatasource extends MoviesDatasource {
  final _dio = _createDio();

  static Dio _createDio() => Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      queryParameters: {
        MovieDbParams.apiKey: Environment.movieDBKey,
        MovieDbParams.language: Environment.movieDBLanguage,
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get(
      Environment.nowPlayingPath,
      queryParameters: {'page': page},
    );
    // final List<Movie> movies= MovieMovieDB.fromJson()
    return [];
  }
}
