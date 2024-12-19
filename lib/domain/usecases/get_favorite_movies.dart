import 'package:app/domain/entities/movie.dart';
import 'package:app/domain/repositories/movie_repository.dart';

abstract class GetFavoriteMovies {
  Future<List<Movie>> call();
}

class GetFavoriteMoviesImpl implements GetFavoriteMovies {
  final MovieRepository _movieRepository;

  GetFavoriteMoviesImpl({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<List<Movie>> call() async {
    return await _movieRepository.getFavorites();
  }
}
