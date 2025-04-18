import 'package:weather_app_ddd/domain/weather/aqi_entity.dart';

class AQI extends AqiEntity {
  const AQI({required super.component, required super.index});

  factory AQI.fromJson(Map<String, dynamic> json) {
    final List listAQI = json["list"] ?? [];
    final Map aqi = listAQI.first;
    final int index = aqi["main"]["aqi"];
    final Map<String, dynamic> components = aqi["components"];

    return AQI(index: index, component: AQIComponent.fromJson(components));
  }
}

class AQIComponent extends AQIComponentEntity {
  const AQIComponent({
    required super.co,
    required super.no,
    required super.no2,
    required super.o3,
    required super.so2,
    required super.pm2_5,
    required super.pm10,
    required super.nh3,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'co': co,
      'no': no,
      'no2': no2,
      'o3': o3,
      'so2': so2,
      'pm2_5': pm2_5,
      'pm10': pm10,
      'nh3': nh3,
    };
  }

  factory AQIComponent.fromJson(Map<String, dynamic> map) {
    return AQIComponent(
      co: map['co'] ?? 0,
      no: map['no'] ?? 0,
      no2: map['no2'] ?? 0,
      o3: map['o3'] ?? 0,
      so2: map['so2'] ?? 0,
      pm2_5: map['pm2_5'] ?? 0,
      pm10: map['pm10'] ?? 0,
      nh3: map['nh3'] ?? 0,
    );
  }
}
