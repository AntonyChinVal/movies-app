import 'package:app/presentation/bloc/movie_bloc.dart';
import 'package:app/presentation/bloc/movie_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/domain/entities/movie.dart';
import 'package:app/presentation/components/custom_button.dart';
import 'package:app/presentation/theme/theme_extension.dart';
import 'package:go_router/go_router.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: movie.backdropPath != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/original${movie.backdropPath}',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox(
                        width: 80,
                        height: 120,
                        child: Icon(Icons.movie),
                      ),
                    )
                  : Container(
                      color: context.appTheme.primaryColor,
                      child: const Icon(Icons.movie, size: 100),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(context.appTheme.spacingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: context.appTheme.headlineSmall,
                        ),
                      ),
                      CustomButton(
                        text: movie.isFavorite ? 'Remove' : 'Add to Favorites',
                        onPressed: () {
                          context.read<MovieBloc>().add(
                                ToggleFavoriteMovie(movie),
                              );
                          context.pop();
                        },
                        isOutlined: movie.isFavorite,
                      ),
                    ],
                  ),
                  SizedBox(height: context.appTheme.spacingM),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: context.appTheme.spacingXS),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: context.appTheme.titleMedium,
                      ),
                      SizedBox(width: context.appTheme.spacingM),
                      Text(
                        movie.releaseDate,
                        style: context.appTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: context.appTheme.spacingL),
                  Text(
                    'Overview',
                    style: context.appTheme.titleLarge,
                  ),
                  SizedBox(height: context.appTheme.spacingS),
                  Text(
                    movie.overview,
                    style: context.appTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
