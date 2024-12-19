import 'package:app/data/config/env_config.dart';
import 'package:app/data/di/service_locator.dart';
import 'package:app/domain/services/database/local_service.dart';
import 'package:app/presentation/bloc/movie_bloc.dart';
import 'package:app/presentation/di/service_locator.dart';
import 'package:app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/domain/di/service_locator.dart';
import 'package:app/presentation/theme/app_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.initialize();
  await setupDataServiceLocator();
  await dataServiceLocator<LocalService>().initialize();
  await setupDomainServiceLocator();
  await setupPresentationServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => presentationServiceLocator<MovieBloc>(),
      child: MaterialApp.router(
        title: 'Movie App',
        theme: ThemeData(
          useMaterial3: true,
          extensions: [AppThemeData.light],
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          extensions: [AppThemeData.dark],
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
