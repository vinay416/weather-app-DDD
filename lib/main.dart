import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_ddd/application/weather/aqi/aqi_bloc.dart';
import 'package:weather_app_ddd/injectable_di.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<AQIBloc>())],
      child: const MaterialApp(
        home: Scaffold(body: Center(child: Text('Hello World!'))),
      ),
    );
  }
}
