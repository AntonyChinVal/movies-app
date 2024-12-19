import 'package:app/presentation/bloc/movie_bloc.dart';
import 'package:app/presentation/bloc/movie_event.dart';
import 'package:app/presentation/bloc/movie_state.dart';
import 'package:app/presentation/components/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app/presentation/components/movie_card.dart';
import 'package:app/presentation/theme/theme_extension.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<MovieBloc>().add(const LoadMoreMovies());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieBloc, MovieState>(
      listenWhen: (previous, current) => current is MovieError,
      listener: (context, state) {
        if (state is MovieError) {
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              message: state.message,
              onRetry: state.canRetry
                  ? () {
                      context.read<MovieBloc>().add(const LoadMovies());
                    }
                  : null,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.appTheme.backgroundColor,
        appBar: AppBar(
          title: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              return Text(
                state.isConnected ? 'Movies' : 'Favorite Movies (Offline)',
                style: context.appTheme.titleLarge,
              );
            },
          ),
        ),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MoviesLoaded) {
              final movies = state.isConnected
                  ? state.moviesResponse?.results ?? []
                  : state.favoriteMovies;

              if (movies.isEmpty) {
                return Center(
                  child: Text(
                    state.isConnected
                        ? 'No movies available'
                        : 'No favorite movies saved offline',
                    style: context.appTheme.bodyLarge,
                  ),
                );
              }

              return ListView.separated(
                controller: _scrollController,
                padding: EdgeInsets.all(context.appTheme.spacingM),
                itemCount: movies.length + (state.isLoadingMore ? 1 : 0),
                separatorBuilder: (context, index) =>
                    SizedBox(height: context.appTheme.spacingM),
                itemBuilder: (context, index) {
                  if (index >= movies.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final movie = movies[index];
                  return MovieCard(
                    movie: movie,
                    onFavoritePressed: () {
                      context.read<MovieBloc>().add(ToggleFavoriteMovie(movie));
                    },
                    onTap: () =>
                        context.push('/movie/${movie.id}', extra: movie),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
