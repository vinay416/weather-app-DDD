import 'package:dartz/dartz.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';

abstract class ILocationFacade {
  Future<Either<Failure,LatLong>> getCurrentLatLong();
}
