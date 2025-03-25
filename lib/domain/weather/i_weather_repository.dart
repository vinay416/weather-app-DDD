import '../../core/lat_lon.dart';
import '../../infrastructure/weather/aqi.dart';

abstract class IWeatherRepository {
  Future<AQI> getAIQ(LatLong latlong);
}