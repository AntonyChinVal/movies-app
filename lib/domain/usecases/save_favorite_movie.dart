import 'package:app/domain/entities/movie.dart';
import 'package:app/domain/repositories/movie_repository.dart';

abstract class SaveFavoriteMovie {
  Future<void> call(Movie movie);
}

class SaveFavoriteMovieImpl implements SaveFavoriteMovie {
  final MovieRepository _movieRepository;

  SaveFavoriteMovieImpl({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<void> call(Movie movie) async {
    await _movieRepository.saveFavorite(movie);
  }
}
