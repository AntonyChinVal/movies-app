import 'package:mockito/annotations.dart';
import 'package:app/domain/services/network/network_service.dart';
import 'package:app/domain/services/database/local_service.dart';
import 'package:app/domain/services/network/connectivity_service.dart';
import 'package:app/domain/repositories/movie_repository.dart';
import 'package:app/domain/usecases/get_movies.dart';
import 'package:app/domain/usecases/get_favorite_movies.dart';
import 'package:app/domain/usecases/save_favorite_movie.dart';
import 'package:app/domain/usecases/remove_favorite_movie.dart';

@GenerateMocks([
  NetworkService,
  LocalService,
  ConnectivityService,
  MovieRepository,
  GetMovies,
  GetFavoriteMovies,
  SaveFavoriteMovie,
  RemoveFavoriteMovie,
])
void main() {}
