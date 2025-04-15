import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/infrastructure/location/location_data_source.dart';

@GenerateMocks([MyLocator])
class MyLocator extends Mock implements Location {}

@GenerateMocks([MyLocationSource])
class MyLocationSource extends Mock implements LocationDataSource {}