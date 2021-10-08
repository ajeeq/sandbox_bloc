import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_weather/app.dart';
import 'package:flutter_weather/weather_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_repository/weather_repository.dart';


import 'package:sandbox_bloc/sandboxes/weather/weather_app.dart';

void main() {
  // Loading env file for accessing secured environment variables
  // await dotenv.load(fileName: "local.env");

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = WeatherBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // main -> sandbox project entry (now = weather)
        '/': (context) => const WeatherApp(weatherRepository: WeatherRepository()),
      },
    );
  }
}