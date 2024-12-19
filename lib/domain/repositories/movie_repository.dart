import 'package:app/domain/entities/movie.dart';
import 'package:app/domain/entities/movie_response.dart';

abstract class MovieRepository {
  Future<MoviesResponse> getMovieList({
    required int page,
  });

  Future<void> saveFavorite(Movie movie);

  Future<void> removeFavorite(int movieId);

  Future<List<Movie>> getFavorites();
}
