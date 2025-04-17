import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';
import 'package:weather_app_ddd/domain/weather/i_weather_facade.dart';
import 'package:weather_app_ddd/infrastructure/weather/aqi.dart';

import '../../domain/weather/i_weather_repository.dart';

@LazySingleton(as: IWeatherFacade)
class WeatherFacadeImpl implements IWeatherFacade {
  WeatherFacadeImpl(this.weatherRepository);
  final IWeatherRepository weatherRepository;

  @override
  Future<Either<Failure, AQI>> getAIQ(LatLong latlong) async {
    try {
      final aqi = await weatherRepository.getAIQ(latlong);
      return Right(aqi);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
