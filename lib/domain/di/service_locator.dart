import 'package:app/domain/usecases/get_favorite_movies.dart';
import 'package:app/domain/usecases/get_movies.dart';
import 'package:app/domain/usecases/remove_favorite_movie.dart';
import 'package:app/domain/usecases/save_favorite_movie.dart';
import 'package:get_it/get_it.dart';

final GetIt domainServiceLocator = GetIt.instance;

Future<void> setupDomainServiceLocator() async {
  // Use cases
  domainServiceLocator.registerLazySingleton<GetMovies>(
    () => GetMoviesImpl(movieRepository: domainServiceLocator()),
  );

  domainServiceLocator.registerLazySingleton<GetFavoriteMovies>(
    () => GetFavoriteMoviesImpl(movieRepository: domainServiceLocator()),
  );

  domainServiceLocator.registerLazySingleton<SaveFavoriteMovie>(
    () => SaveFavoriteMovieImpl(movieRepository: domainServiceLocator()),
  );

  domainServiceLocator.registerLazySingleton<RemoveFavoriteMovie>(
    () => RemoveFavoriteMovieImpl(movieRepository: domainServiceLocator()),
  );
}
