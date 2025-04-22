import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_ddd/application/weather/aqi/aqi_bloc.dart';
import 'package:weather_app_ddd/core/assets_const.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

class AqiPermissionError extends StatelessWidget {
  const AqiPermissionError({super.key, required this.msg});
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsConst.kPermissionErrorSvg, width: 300),
                SizedBox(height: 50),
                Text(
                  msg,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 80),
                _buildRequestButton(context),
                SizedBox(height: 10),
                _buildOpenSettings(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton _buildOpenSettings() {
    return TextButton(
      onPressed: () {
        AppSettings.openAppSettings(type: AppSettingsType.location);
      },
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(kPrimaryTextColor),
      ),
      child: Text("Open Settings", style: TextStyle(fontSize: 14)),
    );
  }

  Widget _buildRequestButton(BuildContext context) {
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
