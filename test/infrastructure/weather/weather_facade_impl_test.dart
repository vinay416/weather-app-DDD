import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';
import 'package:weather_app_ddd/infrastructure/weather/aqi.dart';
import 'package:weather_app_ddd/infrastructure/weather/weather_facade_impl.dart';

import '../../fixtures/aqi_fixture.dart';
import 'mock_weather_repo.mocks.dart';

void main() {
  final mockRepo = MockWeatherRepo();
  final weather = WeatherFacadeImpl(mockRepo);

  group("Weather Facade Impl", () {
    test("GET AQI -> Success", () async {
      const LatLong latlong = LatLong(lat: 50, lon: 50);
      final AQI aqi = AQI.fromJson(AQI_FIXTURE);
      //assert
      when(mockRepo.getAIQ(latlong)).thenAnswer((_) async => aqi);
      //act
      final response = await weather.getAIQ(latlong);
      //verify
      verify(mockRepo.getAIQ(latlong));
      expect(response, Right(aqi));
    });

    test("GET AQI -> Failed", () async {
      const LatLong latlong = LatLong(lat: 50, lon: 50);
      //assert
      when(mockRepo.getAIQ(latlong)).thenThrow(ServerException());
      //act
      final response = await weather.getAIQ(latlong);
      //verify
      verify(mockRepo.getAIQ(latlong));
      expect(response, Left(ServerFailure()));
    });
  });
}
