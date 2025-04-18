import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../core/weather/lat_lon.dart';
import '../../infrastructure/weather/aqi.dart';

abstract class IWeatherFacade {
  Future<Either<Failure, AQI>> getAIQ(LatLong latlong);
}
