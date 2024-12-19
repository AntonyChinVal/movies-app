import 'package:equatable/equatable.dart';
import 'package:app/domain/entities/movie.dart';
import 'package:app/domain/entities/movie_response.dart';

abstract class MovieState extends Equatable {
  final bool isConnected;

  const MovieState({this.isConnected = true});

  @override
  List<Object?> get props => [isConnected];
}

class MovieInitial extends MovieState {
  const MovieInitial({super.isConnected});
}

class MovieLoading extends MovieState {
  const MovieLoading({super.isConnected});
}

class MovieError extends MovieState {
  final String message;
  final String? errorCode;
  final bool canRetry;

  const MovieError(
    this.message, {
    required super.isConnected,
    this.errorCode,
    this.canRetry = true,
  });

  @override
  List<Object?> get props => [message, isConnected, errorCode, canRetry];
}

class MoviesLoaded extends MovieState {
  final MoviesResponse? moviesResponse;
  final List<Movie> favoriteMovies;
  final bool isLoadingMore;
  final bool hasReachedMax;

  const MoviesLoaded({
    this.moviesResponse,
    this.favoriteMovies = const [],
    required super.isConnected,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });

  @override
  List<Object?> get props => [
        moviesResponse,
        favoriteMovies,
        isConnected,
        isLoadingMore,
        hasReachedMax,
      ];

  MoviesLoaded copyWith({
    MoviesResponse? moviesResponse,
    List<Movie>? favoriteMovies,
    bool? isConnected,
    bool? isLoadingMore,
    bool? hasReachedMax,
  }) {
    return MoviesLoaded(
      moviesResponse: moviesResponse ?? this.moviesResponse,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      isConnected: isConnected ?? this.isConnected,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
