import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_ddd/application/weather/aqi/aqi_bloc.dart';
import 'package:weather_app_ddd/core/assets_const.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

class AqiPermissionError extends StatelessWidget {
  const AqiPermissionError({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsConst.kPermissionErrorSvg, width: 300),
            Text(
              "Permission Error!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AQIBloc>().add(FetchAQI());
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(kRedColor),
                foregroundColor: WidgetStatePropertyAll(kPrimaryTextColor),
              ),
              child: Text("Request Permission", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
