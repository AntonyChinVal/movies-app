import 'package:app/presentation/screens/movie_detail_screen.dart';
import 'package:app/presentation/screens/movie_list_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:app/domain/entities/movie.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MovieListScreen(),
    ),
    GoRoute(
      path: '/movie/:id',
      builder: (context, state) {
        final movie = state.extra as Movie;
        return MovieDetailScreen(movie: movie);
      },
    ),
  ],
);
