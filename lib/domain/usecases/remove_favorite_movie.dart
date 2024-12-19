import 'package:app/domain/repositories/movie_repository.dart';

abstract class RemoveFavoriteMovie {
  Future<void> call(int movieId);
}

class RemoveFavoriteMovieImpl implements RemoveFavoriteMovie {
  final MovieRepository _movieRepository;

  RemoveFavoriteMovieImpl({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<void> call(int movieId) async {
    await _movieRepository.removeFavorite(movieId);
  }
}
