// Mocks generated by Mockito 5.4.4 from annotations
// in app/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:app/domain/entities/movie.dart' as _i10;
import 'package:app/domain/entities/movie_response.dart' as _i4;
import 'package:app/domain/repositories/movie_repository.dart' as _i9;
import 'package:app/domain/services/database/local_service.dart' as _i7;
import 'package:app/domain/services/network/connectivity_service.dart' as _i8;
import 'package:app/domain/services/network/network_service.dart' as _i5;
import 'package:app/domain/usecases/get_favorite_movies.dart' as _i12;
import 'package:app/domain/usecases/get_movies.dart' as _i11;
import 'package:app/domain/usecases/remove_favorite_movie.dart' as _i14;
import 'package:app/domain/usecases/save_favorite_movie.dart' as _i13;
import 'package:isar/isar.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFuture_0<T1> extends _i1.SmartFake implements _i2.Future<T1> {
  _FakeFuture_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIsarCollection_1<OBJ> extends _i1.SmartFake
    implements _i3.IsarCollection<OBJ> {
  _FakeIsarCollection_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMoviesResponse_2 extends _i1.SmartFake
    implements _i4.MoviesResponse {
  _FakeMoviesResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NetworkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkService extends _i1.Mock implements _i5.NetworkService {
  MockNetworkService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<T> get<T>({
    required String? endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
          {
            #endpoint: endpoint,
            #headers: headers,
            #queryParameters: queryParameters,
          },
        ),
        returnValue: _i6.ifNotNull(
              _i6.dummyValueOrNull<T>(
                this,
                Invocation.method(
                  #get,
                  [],
                  {
                    #endpoint: endpoint,
                    #headers: headers,
                    #queryParameters: queryParameters,
                  },
                ),
              ),
              (T v) => _i2.Future<T>.value(v),
            ) ??
            _FakeFuture_0<T>(
              this,
              Invocation.method(
                #get,
                [],
                {
                  #endpoint: endpoint,
                  #headers: headers,
                  #queryParameters: queryParameters,
                },
              ),
            ),
      ) as _i2.Future<T>);
}

/// A class which mocks [LocalService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalService extends _i1.Mock implements _i7.LocalService {
  MockLocalService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<void> initialize() => (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i3.IsarCollection<T> getCollection<T>() => (super.noSuchMethod(
        Invocation.method(
          #getCollection,
          [],
        ),
        returnValue: _FakeIsarCollection_1<T>(
          this,
          Invocation.method(
            #getCollection,
            [],
          ),
        ),
      ) as _i3.IsarCollection<T>);

  @override
  _i2.Future<void> save<T>(T? data) => (super.noSuchMethod(
        Invocation.method(
          #save,
          [data],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<void> saveAll<T>(List<T>? items) => (super.noSuchMethod(
        Invocation.method(
          #saveAll,
          [items],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<T?> get<T>(dynamic id) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [id],
        ),
        returnValue: _i2.Future<T?>.value(),
      ) as _i2.Future<T?>);

  @override
  _i2.Future<List<T>> getAll<T>() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i2.Future<List<T>>.value(<T>[]),
      ) as _i2.Future<List<T>>);

  @override
  _i2.Future<void> delete<T>(dynamic id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<void> deleteAll<T>() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<void> update<T>(T? data) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [data],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<bool> exists<T>(dynamic id) => (super.noSuchMethod(
        Invocation.method(
          #exists,
          [id],
        ),
        returnValue: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);

  @override
  _i2.Future<void> writeTransactionSync<T>(Function? transaction) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeTransactionSync,
          [transaction],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);
}

/// A class which mocks [ConnectivityService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivityService extends _i1.Mock
    implements _i8.ConnectivityService {
  MockConnectivityService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Stream<bool> get onConnectivityChanged => (super.noSuchMethod(
        Invocation.getter(#onConnectivityChanged),
        returnValue: _i2.Stream<bool>.empty(),
      ) as _i2.Stream<bool>);

  @override
  _i2.Future<bool> isConnected() => (super.noSuchMethod(
        Invocation.method(
          #isConnected,
          [],
        ),
        returnValue: _i2.Future<bool>.value(false),
      ) as _i2.Future<bool>);
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i9.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<_i4.MoviesResponse> getMovieList({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieList,
          [],
          {#page: page},
        ),
        returnValue: _i2.Future<_i4.MoviesResponse>.value(_FakeMoviesResponse_2(
          this,
          Invocation.method(
            #getMovieList,
            [],
            {#page: page},
          ),
        )),
      ) as _i2.Future<_i4.MoviesResponse>);

  @override
  _i2.Future<void> saveFavorite(_i10.Movie? movie) => (super.noSuchMethod(
        Invocation.method(
          #saveFavorite,
          [movie],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<void> removeFavorite(int? movieId) => (super.noSuchMethod(
        Invocation.method(
          #removeFavorite,
          [movieId],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);

  @override
  _i2.Future<List<_i10.Movie>> getFavorites() => (super.noSuchMethod(
        Invocation.method(
          #getFavorites,
          [],
        ),
        returnValue: _i2.Future<List<_i10.Movie>>.value(<_i10.Movie>[]),
      ) as _i2.Future<List<_i10.Movie>>);
}

/// A class which mocks [GetMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovies extends _i1.Mock implements _i11.GetMovies {
  MockGetMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<_i4.MoviesResponse> call({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#page: page},
        ),
        returnValue: _i2.Future<_i4.MoviesResponse>.value(_FakeMoviesResponse_2(
          this,
          Invocation.method(
            #call,
            [],
            {#page: page},
          ),
        )),
      ) as _i2.Future<_i4.MoviesResponse>);
}

/// A class which mocks [GetFavoriteMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetFavoriteMovies extends _i1.Mock implements _i12.GetFavoriteMovies {
  MockGetFavoriteMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<List<_i10.Movie>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i2.Future<List<_i10.Movie>>.value(<_i10.Movie>[]),
      ) as _i2.Future<List<_i10.Movie>>);
}

/// A class which mocks [SaveFavoriteMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveFavoriteMovie extends _i1.Mock implements _i13.SaveFavoriteMovie {
  MockSaveFavoriteMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<void> call(_i10.Movie? movie) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [movie],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);
}

/// A class which mocks [RemoveFavoriteMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveFavoriteMovie extends _i1.Mock
    implements _i14.RemoveFavoriteMovie {
  MockRemoveFavoriteMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<void> call(int? movieId) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [movieId],
        ),
        returnValue: _i2.Future<void>.value(),
        returnValueForMissingStub: _i2.Future<void>.value(),
      ) as _i2.Future<void>);
}
