import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/infrastructure/core/lat_lon.dart';
import 'package:weather_app_ddd/domain/location/i_location_facade.dart';
import 'package:weather_app_ddd/infrastructure/location/location_data_source.dart';

@LazySingleton(as: ILocationFacade)
class LocationFacadeImpl implements ILocationFacade {
  LocationFacadeImpl(this.locator);
  final LocationDataSource locator;

  @override
  Future<Either<Failure, LatLong>> getCurrentLatLong() async {
    try {
      final latlon = await locator.getCurrentLatLong();
      return Right(latlon);
    } on LocationPermissionException catch (e) {
      return Left(LocationPermissionFailure(e.msg));
    } on LocationServiceException catch (e) {
      return Left(LocationServiceFailure(e.msg));
    } catch (e) {
      return Left(LocationServiceFailure("Something went wrong"));
    }
  }
}
