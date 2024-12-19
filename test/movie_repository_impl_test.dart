import 'package:app/data/services/database/collections/movie_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:app/data/repositories/movie_repository_impl.dart';
import 'package:app/domain/entities/movie.dart';
import './helpers/test_helper.mocks.dart';

void main() {
  late MockNetworkService mockNetworkService;
  late MockLocalService mockLocalService;
  late MovieRepositoryImpl repository;

  setUp(() {
    mockNetworkService = MockNetworkService();
    mockLocalService = MockLocalService();
    repository = MovieRepositoryImpl(
      networkService: mockNetworkService,
      localService: mockLocalService,
    );
  });

  group('getMovieList', () {
    final tMovieResponse = {
      'page': 1,
      'results': [
        {
          'id': 1,
          'title': 'Test Movie',
          'overview': 'Test Overview',
          'poster_path': '/test.jpg',
          'backdrop_path': '/test_backdrop.jpg',
          'release_date': '2024-01-01',
          'vote_average': 7.5,
          'vote_count': 100,
          'adult': false,
          'genre_ids': [1, 2, 3],
          'original_language': 'en',
          'original_title': 'Test Movie',
          'popularity': 100.0,
          'video': false,
        }
      ],
      'total_pages': 10,
      'total_results': 100,
    };

    test('should return MoviesResponse when successful', () async {
      // Arrange
      when(mockNetworkService.get<Map<String, dynamic>>(
        endpoint: '/discover/movie',
        queryParameters: captureAnyNamed('queryParameters'),
      )).thenAnswer((_) async => tMovieResponse);

      // Act
      final result = await repository.getMovieList(page: 1);

      // Assert
      expect(result.page, 1);
      expect(result.totalPages, 10);
      expect(result.results.length, 1);
      expect(result.results.first.title, 'Test Movie');

      final captured = verify(mockNetworkService.get<Map<String, dynamic>>(
        endpoint: captureAnyNamed('endpoint'),
        queryParameters: captureAnyNamed('queryParameters'),
      )).captured;

      expect(captured[0], '/discover/movie');
      expect(captured[1], {
        'page': 1,
        'include_adult': false,
        'include_video': false,
        'language': 'en-US',
        'sort_by': 'popularity.desc',
      });
    });

    test('should throw exception when network call fails', () {
      // Arrange
      when(mockNetworkService.get<Map<String, dynamic>>(
        endpoint: anyNamed('endpoint'),
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(
        () => repository.getMovieList(page: 1),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('saveFavorite', () {
    final tMovie = Movie(
      id: 1,
      title: 'Test Movie',
      overview: 'Test Overview',
      posterPath: '/test.jpg',
      backdropPath: '/test_backdrop.jpg',
      releaseDate: '2024-01-01',
      voteAverage: 7.5,
      voteCount: 100,
      adult: false,
      genreIds: [1, 2, 3],
      originalLanguage: 'en',
      originalTitle: 'Test Movie',
      popularity: 100.0,
      video: false,
      isFavorite: false,
    );

    test('should save movie to local storage', () async {
      // Arrange
      when(mockLocalService.save(captureAny)).thenAnswer((_) async => {});

      // Act
      await repository.saveFavorite(tMovie);

      // Assert
      verify(mockLocalService.save(captureAny)).called(1);
    });
  });

  group('getFavorites', () {
    test('should return list of favorite movies from local storage', () async {
      // Arrange
      when(mockLocalService.getAll<MovieCollection>())
          .thenAnswer((_) async => []);

      // Act
      final result = await repository.getFavorites();

      // Assert
      expect(result, isEmpty);
      verify(mockLocalService.getAll<MovieCollection>()).called(1);
    });
  });
}
