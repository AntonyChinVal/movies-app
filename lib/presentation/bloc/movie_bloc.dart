import 'dart:async';
import 'package:app/domain/entities/movie_response.dart';
import 'package:app/domain/services/network/connectivity_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/domain/usecases/get_movies.dart';
import 'package:app/domain/usecases/get_favorite_movies.dart';
import 'package:app/domain/usecases/save_favorite_movie.dart';
import 'package:app/domain/usecases/remove_favorite_movie.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovies _getMovies;
  final GetFavoriteMovies _getFavoriteMovies;
  final SaveFavoriteMovie _saveFavoriteMovie;
  final RemoveFavoriteMovie _removeFavoriteMovie;
  final ConnectivityService _connectivityService;
  late StreamSubscription<bool> _connectivitySubscription;

  MovieBloc({
    required GetMovies getMovies,
    required GetFavoriteMovies getFavoriteMovies,
    required SaveFavoriteMovie saveFavoriteMovie,
    required RemoveFavoriteMovie removeFavoriteMovie,
    required ConnectivityService connectivityService,
  })  : _getMovies = getMovies,
        _getFavoriteMovies = getFavoriteMovies,
        _saveFavoriteMovie = saveFavoriteMovie,
        _removeFavoriteMovie = removeFavoriteMovie,
        _connectivityService = connectivityService,
        super(const MovieInitial()) {
    on<LoadMovies>(_onLoadMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<LoadFavoriteMovies>(_onLoadFavoriteMovies);
    on<ToggleFavoriteMovie>(_onToggleFavoriteMovie);
    on<ConnectivityChanged>(_onConnectivityChanged);

    _connectivitySubscription = _connectivityService.onConnectivityChanged
        .listen((isConnected) => add(ConnectivityChanged(isConnected)));

    _initializeData();
  }

  Future<void> _initializeData() async {
    final isConnected = await _connectivityService.isConnected();
    add(ConnectivityChanged(isConnected));
  }

  Future<void> _onConnectivityChanged(
    ConnectivityChanged event,
    Emitter<MovieState> emit,
  ) async {
    if (event.isConnected) {
      add(const LoadMovies());
    } else {
      add(LoadFavoriteMovies());
    }
  }

  Future<void> _onLoadMovies(
    LoadMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      final isConnected = await _connectivityService.isConnected();
      if (!isConnected) {
        add(LoadFavoriteMovies());
        return;
      }

      final moviesResponse = await _getMovies(page: event.page);
      final favorites = await _getFavoriteMovies();

      final updatedResults = moviesResponse.results.map((movie) {
        return movie.copyWith(
          isFavorite: favorites.any((favorite) => favorite.id == movie.id),
        );
      }).toList();

      final updatedResponse = MoviesResponse(
        page: moviesResponse.page,
        results: updatedResults,
        totalPages: moviesResponse.totalPages,
        totalResults: moviesResponse.totalResults,
      );

      emit(MoviesLoaded(
        moviesResponse: updatedResponse,
        favoriteMovies: favorites,
        isConnected: true,
      ));
    } catch (e) {
      emit(MovieError(e.toString(), isConnected: state.isConnected));
    }
  }

  Future<void> _onLoadMoreMovies(
    LoadMoreMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      final isConnected = await _connectivityService.isConnected();
      if (!isConnected) {
        return;
      }

      if (state is! MoviesLoaded) return;
      final currentState = state as MoviesLoaded;

      if (currentState.isLoadingMore || currentState.hasReachedMax) return;

      emit(currentState.copyWith(isLoadingMore: true));

      final nextPage = (currentState.moviesResponse?.page ?? 0) + 1;
      final moviesResponse = await _getMovies(page: nextPage);
      final favorites = await _getFavoriteMovies();

      final updatedResults = moviesResponse.results.map((movie) {
        return movie.copyWith(
          isFavorite: favorites.any((favorite) => favorite.id == movie.id),
        );
      }).toList();

      final currentMovies = currentState.moviesResponse?.results ?? [];
      final updatedResponse = MoviesResponse(
        page: moviesResponse.page,
        results: [...currentMovies, ...updatedResults],
        totalPages: moviesResponse.totalPages,
        totalResults: moviesResponse.totalResults,
      );

      emit(currentState.copyWith(
        moviesResponse: updatedResponse,
        isLoadingMore: false,
        hasReachedMax: moviesResponse.page >= moviesResponse.totalPages,
      ));
    } catch (e) {
      if (state is MoviesLoaded) {
        final currentState = state as MoviesLoaded;
        emit(currentState.copyWith(isLoadingMore: false));
      }
      emit(MovieError(e.toString(), isConnected: state.isConnected));
    }
  }

  Future<void> _onLoadFavoriteMovies(
    LoadFavoriteMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      final favorites = await _getFavoriteMovies();

      emit(MoviesLoaded(
        favoriteMovies: favorites,
        isConnected: await _connectivityService.isConnected(),
      ));
    } catch (e) {
      emit(MovieError(e.toString(), isConnected: state.isConnected));
    }
  }

  Future<void> _onToggleFavoriteMovie(
    ToggleFavoriteMovie event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (event.movie.isFavorite) {
        await _removeFavoriteMovie(event.movie.id);
      } else {
        await _saveFavoriteMovie(event.movie);
      }

      final isConnected = await _connectivityService.isConnected();
      if (isConnected) {
        add(const LoadMovies());
      } else {
        add(LoadFavoriteMovies());
      }
    } catch (e) {
      emit(MovieError(e.toString(), isConnected: state.isConnected));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
