import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean/login/auth/login_mock_api_repository.dart';
import 'package:flutter_bloc_clean/login/auth/login_repository.dart';
import 'package:get_it/get_it.dart';

import 'config/routes/routes.dart';

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.loginScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginMockApiRepository());
}
