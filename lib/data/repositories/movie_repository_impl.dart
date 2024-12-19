import 'package:app/data/services/database/collections/movie_collection.dart';
import 'package:app/domain/entities/movie.dart';
import 'package:app/domain/entities/movie_response.dart';
import 'package:app/domain/repositories/movie_repository.dart';
import 'package:app/domain/services/database/local_service.dart';
import 'package:app/domain/services/network/network_service.dart';
import 'package:isar/isar.dart';

class MovieRepositoryImpl extends MovieRepository {
  final NetworkService _networkService;
  final LocalService _localService;

  MovieRepositoryImpl({
    required NetworkService networkService,
    required LocalService localService,
  })  : _networkService = networkService,
        _localService = localService;

  @override
  Future<MoviesResponse> getMovieList({
    required int page,
  }) async {
    final Map<String, dynamic> queryParams = {
      'page': page,
      'include_adult': false,
      'include_video': false,
      'language': 'en-US',
      'sort_by': 'popularity.desc',
    };
    final response = await _networkService.get<Map<String, dynamic>>(
      endpoint: '/discover/movie',
      queryParameters: queryParams,
    );

    return MoviesResponse.fromJson(response);
  }

  @override
  Future<void> saveFavorite(Movie movie) async {
    final movieCollection = MovieCollection()
      ..movieId = movie.id
      ..adult = movie.adult
      ..backdropPath = movie.backdropPath
      ..genreIds = movie.genreIds
      ..originalLanguage = movie.originalLanguage
      ..originalTitle = movie.originalTitle
      ..overview = movie.overview
      ..popularity = movie.popularity
      ..posterPath = movie.posterPath
      ..releaseDate = movie.releaseDate
      ..title = movie.title
      ..video = movie.video
      ..voteAverage = movie.voteAverage
      ..voteCount = movie.voteCount;

    await _localService.save<MovieCollection>(movieCollection);
  }

  @override
  Future<void> removeFavorite(int movieId) async {
    _localService.writeTransactionSync(() {
      final collection = _localService.getCollection<MovieCollection>();
      collection.filter().movieIdEqualTo(movieId).deleteAllSync();
    });
  }

  @override
  Future<List<Movie>> getFavorites() async {
    final favorites = await _localService.getAll<MovieCollection>();

    return favorites
        .map((movieCollection) => Movie(
            id: movieCollection.movieId,
            adult: movieCollection.adult,
            backdropPath: movieCollection.backdropPath,
            genreIds: movieCollection.genreIds,
            originalLanguage: movieCollection.originalLanguage,
            originalTitle: movieCollection.originalTitle,
            overview: movieCollection.overview,
            popularity: movieCollection.popularity,
            posterPath: movieCollection.posterPath,
            releaseDate: movieCollection.releaseDate,
            title: movieCollection.title,
            video: movieCollection.video,
            voteAverage: movieCollection.voteAverage,
            voteCount: movieCollection.voteCount,
            isFavorite: true))
        .toList();
  }
}
