import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/domain/location/i_location_facade.dart';
import 'package:weather_app_ddd/domain/weather/aqi_entity.dart';
import 'package:weather_app_ddd/domain/weather/i_weather_facade.dart';

part 'aqi_event.dart';
part 'aqi_state.dart';

class AQIBloc extends Bloc<AQIEvent, AQIState> {
  final ILocationFacade locator;
  final IWeatherFacade weather;
  AQIBloc({required this.locator, required this.weather})
    : super(AQIInitial()) {
    on<FetchAQI>(_onFetchAQI);
  }

  FutureOr<void> _onFetchAQI(FetchAQI event, emit) async {
    emit(AQILoading());
    final latlonReponse = await locator.getCurrentLatLong();
    await latlonReponse.fold(
      (failure) {
        if (failure is LocationPermissionFailure) {
          emit(LocationPermissionError(failure.msg));
        } else if (failure is LocationServiceFailure) {
          emit(LocationServiceError(failure.msg));
        } else {
          emit(LocationServiceError("Something went wrong"));
        }
      },
      (latlon) async {
        final aqiResponse = await weather.getAIQ(latlon);
        final state = aqiResponse.fold(
          (failure) => AQIFailed("Something went wrong"),
          (aqi) => AQIData(aqi),
        );
        emit(state);
      },
    );
  }
}
