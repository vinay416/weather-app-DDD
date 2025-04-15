import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';
import 'package:weather_app_ddd/domain/weather/aqi_entity.dart';

part 'aqi_event.dart';
part 'aqi_state.dart';

class AQIBloc extends Bloc<AQIEvent, AQIState> {
  AQIBloc() : super(AQIInitial()) {
    on<AQIEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
