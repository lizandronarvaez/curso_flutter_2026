import 'package:modulo_05_app_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:modulo_05_app_cinemapedia/domain/repositories/movies_repository.dart';
import 'package:modulo_05_app_cinemapedia/domain/entities/movie.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
