import 'package:weather_app_ddd/domain/weather/aqi_entity.dart';

class AQI extends AqiEntity {
  const AQI({required super.components, required super.index});

  factory AQI.fromJson(Map<String, dynamic> json) {
    final List listAQI = json["list"] ?? [];
    final Map aqi = listAQI.first;
    final int index = aqi["main"]["aqi"];
    final Map<String, dynamic> componentsMap = aqi["components"];

    return AQI(index: index, components: componentsMap);
  }
}
