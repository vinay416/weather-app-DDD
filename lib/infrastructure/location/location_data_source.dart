import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/weather/lat_lon.dart';

abstract class LocationDataSource {
  Future<LatLong> getCurrentLatLong();
}

@LazySingleton(as: LocationDataSource) 
class LocationDataSourceImpl implements LocationDataSource {
  const LocationDataSourceImpl({required this.locator});
  final Location locator;

  @override
  Future<LatLong> getCurrentLatLong() async {
    PermissionStatus permission = await locator.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await locator.requestPermission();
      if (permission == PermissionStatus.denied) {
        throw LocationPermissionException("Permission denied");
      }
    }
    if (permission == PermissionStatus.deniedForever) {
      throw LocationPermissionException("Permission permanently denied");
    }
    bool serviceEnabled = await locator.serviceEnabled();
    if (!serviceEnabled) {
      final success = await locator.requestService();
      if (!success) throw LocationServiceException("Service not enabled");
    }

    final location = await locator.getLocation();
    final lat = location.latitude;
    final lon = location.longitude;
    if (lat == null || lon == null) {
      throw LocationServiceException("Unable to get Position");
    }
    return LatLong(lat: lat, lon: lon);
  }
}
