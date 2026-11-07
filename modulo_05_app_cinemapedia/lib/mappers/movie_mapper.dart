import 'package:modulo_05_app_cinemapedia/config/constants/environment.dart';
import 'package:modulo_05_app_cinemapedia/domain/entities/movie.dart';
import 'package:modulo_05_app_cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';
import 'package:modulo_05_app_cinemapedia/utils/app_constants.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movie) => Movie(
    adult: movie.adult,
    backdropPath: (movie.backdropPath != AppConstants.emptyString)
        ? Environment.baseUrlImage + movie.backdropPath
        : Environment.imageMovieDBNotFound,
    genreIds: movie.genreIds.map((e) => e.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath,
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}
