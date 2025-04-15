part of 'aqi_bloc.dart';

sealed class AQIEvent extends Equatable {
  const AQIEvent();

  @override
  List<Object> get props => [];
}

final class FetchAQI extends AQIEvent {}
