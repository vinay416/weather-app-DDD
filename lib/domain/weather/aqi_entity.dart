import 'package:equatable/equatable.dart';

import '../../core/aqi_calculator.dart';
import '../../infrastructure/weather/aqi.dart';

class AqiEntity extends Equatable {
  const AqiEntity({required this.component, required this.index});
  final int index;
  final AQIComponent component;

  String get status => AqiCalculator().aqiStatus(index);

  int get aqiValue => AqiCalculator().calculateAqi(component.pm2_5);

  @override
  List<Object?> get props => [index, component];
}
