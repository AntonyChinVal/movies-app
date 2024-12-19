import 'package:app/domain/entities/movie_response.dart';
import 'package:app/domain/repositories/movie_repository.dart';

abstract class GetMovies {
  Future<MoviesResponse> call({required int page});
}

class GetMoviesImpl implements GetMovies {
  final MovieRepository _movieRepository;

  GetMoviesImpl({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<MoviesResponse> call({required int page}) async {
    return await _movieRepository.getMovieList(page: page);
  }
}
