import 'package:dio/dio.dart';
import 'package:modulo_05_app_cinemapedia/config/constants/environment.dart';
import 'package:modulo_05_app_cinemapedia/config/constants/moviedb_constants.dart';
import 'package:modulo_05_app_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:modulo_05_app_cinemapedia/domain/entities/movie.dart';
import 'package:modulo_05_app_cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:modulo_05_app_cinemapedia/mappers/movie_mapper.dart';

class MoviedbDatasource extends MoviesDatasource {

  final _dio = _createDio();

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get(
      Environment.nowPlayingPath,
      queryParameters: {MovieDbParams.page: page},
    );

    return _getResultMoviesFromJson(response.data);
  }

  static Dio _createDio() => Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      queryParameters: {
        MovieDbParams.apiKey: Environment.movieDBKey,
        MovieDbParams.language: Environment.movieDBLanguage,
      },
    ),
  );

  static List<Movie> _getResultMoviesFromJson(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
        .where((movie)=> movie.posterPath != Environment.imageMovieDBNotFound)
        .map((movie) => MovieMapper.movieDBToEntity(movie))
        .toList();
    return movies;
  }
}
