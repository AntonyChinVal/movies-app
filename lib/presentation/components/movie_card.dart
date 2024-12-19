import 'package:flutter/material.dart';
import 'package:app/domain/entities/movie.dart';
import 'package:app/presentation/theme/theme_extension.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onFavoritePressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.appTheme.radiusM),
      child: Container(
        padding: EdgeInsets.all(context.appTheme.spacingM),
        decoration: BoxDecoration(
          color: context.appTheme.surfaceColor,
          borderRadius: BorderRadius.circular(context.appTheme.radiusM),
        ),
        child: Row(
          children: [
            if (movie.posterPath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(context.appTheme.radiusS),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(
                    width: 80,
                    height: 120,
                    child: Icon(Icons.movie),
                  ),
                ),
              ),
            SizedBox(width: context.appTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: context.appTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.appTheme.spacingXS),
                  Text(
                    movie.releaseDate,
                    style: context.appTheme.bodySmall,
                  ),
                  SizedBox(height: context.appTheme.spacingXS),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                      SizedBox(width: context.appTheme.spacingXXS),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: context.appTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                movie.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: movie.isFavorite ? Colors.red : null,
              ),
              onPressed: onFavoritePressed,
            ),
          ],
        ),
      ),
    );
  }
}
