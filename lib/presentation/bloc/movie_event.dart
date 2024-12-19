import 'package:equatable/equatable.dart';
import 'package:app/domain/entities/movie.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovies extends MovieEvent {
  final int page;

  const LoadMovies({this.page = 1});

  @override
  List<Object?> get props => [page];
}

class ToggleFavoriteMovie extends MovieEvent {
  final Movie movie;

  const ToggleFavoriteMovie(this.movie);

  @override
  List<Object?> get props => [movie];
}

class LoadFavoriteMovies extends MovieEvent {}

class ConnectivityChanged extends MovieEvent {
  final bool isConnected;

  const ConnectivityChanged(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}

class LoadMoreMovies extends MovieEvent {
  const LoadMoreMovies();
}
