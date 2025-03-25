// Possible index: 1, 2, 3, 4, 5. Where 1 = Good, 2 = Fair, 3 = Moderate, 4 = Poor, 5 = Very Poor.
import 'package:equatable/equatable.dart';
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

class AQIComponent extends Equatable {
  const AQIComponent({
    required this.co,
    required this.no,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.nh3,
  });
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;
  final double pm2_5;
  final double pm10;
  final double nh3;

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

  @override
  List<Object?> get props => [co, no, no2, o3, so2, pm2_5, pm10, nh3];
}
