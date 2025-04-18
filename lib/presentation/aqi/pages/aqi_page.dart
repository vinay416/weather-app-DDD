import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_ddd/application/weather/aqi/aqi_bloc.dart';
import 'package:weather_app_ddd/presentation/aqi/pages/aqi_loaded.dart';
import 'package:weather_app_ddd/presentation/aqi/pages/aqi_permission_error.dart';
import 'package:weather_app_ddd/presentation/aqi/pages/aqi_shimmer.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/aqi_meter.dart';

class AqiPage extends StatefulWidget {
  const AqiPage({super.key});

  @override
  State<AqiPage> createState() => _AqiPageState();
}

class _AqiPageState extends State<AqiPage> {
  @override
  void initState() {
    super.initState();
    // context.read<AQIBloc>().add(FetchAQI());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AQIBloc, AQIState>(
        builder: (context, state) {
          return AqiPermissionError();
          return AqiShimmer();
          if (state is AQILoading) {
            // shimmer
          }
          if (state is LocationPermissionError) {}
          if (state is LocationServiceError) {}
          if (state is AQIData) {}
          //AQIFailed
          return AqiLoaded();
        },
      ),
    );
  }
}
