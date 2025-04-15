import 'package:location/location.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';

abstract class LocationDataSource {
  Future<LatLong> getCurrentLatLong();
}

class LocationDataSourceImpl implements LocationDataSource {
  const LocationDataSourceImpl({required this.locator});
  final Location locator;

  @override
  Future<LatLong> getCurrentLatLong() async {
    PermissionStatus permission = await locator.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await locator.requestPermission();
      if (permission == PermissionStatus.denied) {
        throw LocationException("Permission denied");
      }
    }
    if (permission == PermissionStatus.deniedForever) {
      throw LocationException("Permission permanently denied");
    }
    bool serviceEnabled = await locator.serviceEnabled();
    if (!serviceEnabled) {
      final success = await locator.requestService();
      if (!success) throw LocationException("Service not enabled");
    }

    final location = await locator.getLocation();
    final lat = location.latitude;
    final lon = location.longitude;
    if (lat == null || lon == null) {
      throw LocationException("Unable to get Position");
    }
    return LatLong(lat: lat, lon: lon);
  }


}
