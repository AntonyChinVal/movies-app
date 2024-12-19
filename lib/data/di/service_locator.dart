import 'package:app/data/repositories/movie_repository_impl.dart';
import 'package:app/data/services/network/connectivity_service_impl.dart';
import 'package:app/domain/services/database/local_service.dart';
import 'package:app/data/services/database/local_service_impl.dart';
import 'package:app/domain/services/network/connectivity_service.dart';
import 'package:app/domain/services/network/network_service.dart';
import 'package:app/data/services/network/network_service_impl.dart';
import 'package:app/domain/repositories/movie_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt dataServiceLocator = GetIt.instance;

Future<void> setupDataServiceLocator() async {
  // Services
  dataServiceLocator.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(),
  );

  dataServiceLocator.registerSingleton<LocalService>(LocalServiceImpl());

  dataServiceLocator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );

  // Repositories
  dataServiceLocator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      networkService: dataServiceLocator(),
      localService: dataServiceLocator(),
    ),
  );
}
