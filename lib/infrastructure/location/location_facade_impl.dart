import 'package:dartz/dartz.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';
import 'package:weather_app_ddd/domain/location/i_location_facade.dart';
import 'package:weather_app_ddd/infrastructure/location/location_data_source.dart';

class LocationFacadeImpl implements ILocationFacade {
  LocationFacadeImpl(this.locator);
  final LocationDataSource locator;

  @override
  Future<Either<Failure, LatLong>> getCurrentLatLong() async {
    try {
      final latlon = await locator.getCurrentLatLong();
      return Right(latlon);
    } on LocationException catch (e) {
      return Left(LocationFailure(e.msg));
    } catch (e) {
      return Left(LocationFailure("Something went wrong"));
    }
  }
}
