import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_ddd/application/weather/aqi/aqi_bloc.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => context.read<AQIBloc>().add(FetchAQI()),
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          backgroundColor: WidgetStatePropertyAll(kRedColor),
          foregroundColor: WidgetStatePropertyAll(kPrimaryTextColor),
        ),
        child: Text("Retry", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
