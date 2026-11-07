import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get movieDBKey => dotenv.get('THE_MOVIEDB_KEY');
  static String get baseUrl => dotenv.get('BASE_URL_MOVIEDB');
  static String get movieDBLanguage => dotenv.get('MOVIEDB_LANGUAGE');
  static String get nowPlayingPath => dotenv.get('MOVIEDB_NOW_PLAYING_PATH');
  static String get moviePath => dotenv.get('MOVIEDB_MOVIE_PATH');
  static String get baseUrlImage=> dotenv.get('BASE_URL_MOVIE_IMAGE');
  static String get imageMovieDBNotFound=>dotenv.get('MOVIEDB_IMAGE_NOT_FOUND');
  static String movieByIdPath(String movieId) => '$moviePath/$movieId';
}
