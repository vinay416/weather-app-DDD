import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/domain/weather/i_weather_repository.dart';

@GenerateMocks([WeatherRepo])
class WeatherRepo extends Mock implements IWeatherRepository {}
