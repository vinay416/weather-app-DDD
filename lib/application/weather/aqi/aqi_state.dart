part of 'aqi_bloc.dart';

sealed class AQIState extends Equatable {
  const AQIState();

  @override
  List<Object> get props => [];
}

final class AQIInitial extends AQIState {}

final class AQILoading extends AQIState {}

final class LocationPermissionError extends AQIState {
  const LocationPermissionError(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}

final class LocationServiceError extends AQIState {
  const LocationServiceError(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}

final class AQIData extends AQIState {
  const AQIData(this.aqiEntity);
  final AqiEntity aqiEntity;

  @override
  List<Object> get props => [aqiEntity];
}

final class AQIFailed extends AQIState {
  const AQIFailed(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}
