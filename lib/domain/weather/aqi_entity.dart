import 'package:equatable/equatable.dart';

import '../../core/weather/aqi_calculator.dart';

// Possible index: 1, 2, 3, 4, 5. Where 1 = Good, 2 = Fair, 3 = Moderate, 4 = Poor, 5 = Very Poor.
class AqiEntity extends Equatable {
  const AqiEntity({required this.component, required this.index});
  final int index;
  final AQIComponentEntity component;

  String get status => AqiCalculator().aqiStatus(index);

  int get aqiValue => AqiCalculator().calculateAqi(component.pm2_5);

  @override
  List<Object?> get props => [index, component];
}

class AQIComponentEntity extends Equatable {
  const AQIComponentEntity({
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

  @override
  List<Object?> get props => [co, no, no2, o3, so2, pm2_5, pm10, nh3];
}
