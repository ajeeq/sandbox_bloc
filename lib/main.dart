// dependencies
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import 'package:sandbox_bloc/sandboxes/weather/bloc/weather_bloc.dart';

//cubit
import 'package:sandbox_bloc/sandboxes/weather/cubit/weather_cubit.dart';

// data repository
import 'package:sandbox_bloc/sandboxes/weather/data/weather_repository.dart';

// sandboxes
import 'package:sandbox_bloc/sandboxes/weather/weather_search_page.dart';

void main() {
  // Loading env file for accessing secured environment variables
  // await dotenv.load(fileName: "local.env");

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
        // main -> sandbox project entry (now = weather)
        // '/': (context) => const WeatherApp(weatherRepository: WeatherRepository()),
      // },

      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherBloc(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}