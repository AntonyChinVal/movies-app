import 'package:app/presentation/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt presentationServiceLocator = GetIt.instance;

Future<void> setupPresentationServiceLocator() async {
  // Use cases
  presentationServiceLocator.registerLazySingleton<MovieBloc>(
    () => MovieBloc(
      getMovies: presentationServiceLocator(),
      getFavoriteMovies: presentationServiceLocator(),
      saveFavoriteMovie: presentationServiceLocator(),
      removeFavoriteMovie: presentationServiceLocator(),
      connectivityService: presentationServiceLocator(),
    ),
  );
}
