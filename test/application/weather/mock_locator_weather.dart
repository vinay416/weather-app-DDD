import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/domain/location/i_location_facade.dart';
import 'package:weather_app_ddd/domain/weather/i_weather_facade.dart';

@GenerateMocks([MyLocatorFacade])
class MyLocatorFacade extends Mock implements ILocationFacade {}

@GenerateMocks([MyWeatherFacade])
class MyWeatherFacade extends Mock implements IWeatherFacade {}
