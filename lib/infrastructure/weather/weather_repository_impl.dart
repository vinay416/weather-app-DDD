import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_ddd/core/app_scerets.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/weather/lat_lon.dart';
import 'package:weather_app_ddd/domain/weather/i_weather_repository.dart';
import 'package:weather_app_ddd/infrastructure/weather/aqi.dart';

// ignore_for_file: constant_identifier_names
const String WEATHER_BASE_URL = "http://api.openweathermap.org";

//* /data/2.5/air_pollution?lat={lat}&lon={lon}&appid={API key}
const String GET_AQI_URL = "/data/2.5/air_pollution";

const String APP_ID = AppScerets.OPEN_WEATHER_API_KEY;

@LazySingleton(as: IWeatherRepository)
class WeatherRepositoryImpl implements IWeatherRepository {
  WeatherRepositoryImpl(this.dio);
  final Dio dio;

  @override
  Future<AQI> getAIQ(LatLong latlong) async {
    try {
      final response = await dio.get(
        WEATHER_BASE_URL + GET_AQI_URL,
        queryParameters: {
          "lat": latlong.lat,
          "lon": latlong.lon,
          "appid": APP_ID,
        },
      );
      if (response.statusCode != 200) throw response;

      return AQI.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
