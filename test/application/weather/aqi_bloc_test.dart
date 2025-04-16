import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/application/weather/aqi/aqi_bloc.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';
import 'package:weather_app_ddd/infrastructure/weather/aqi.dart';

import '../../fixtures/aqi_fixture.dart';
import 'mock_locator_weather.mocks.dart';

void main() {
  final mockLocator = MockMyLocatorFacade();
  final mockWeather = MockMyWeatherFacade();
  final bloc = AQIBloc(locator: mockLocator, weather: mockWeather);

  group("AQI Bloc", () {
    test("Initial state", () {
      //verify
      expect(bloc.state, AQIInitial());
    });

    test("GET AQI success", () async {
      //assert
      when(
        mockLocator.getCurrentLatLong(),
      ).thenAnswer((_) async => Right(LatLong(lat: 15, lon: 15)));
      final aqiJson = AQI_FIXTURE;
      final aqi = AQI.fromJson(aqiJson);
      when(mockWeather.getAIQ(any)).thenAnswer((_) async => Right(aqi));
      //expect Later - bloc states
      final expected = [AQILoading(), AQIData(aqi)];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(FetchAQI());
      //verify calls
      await untilCalled(mockLocator.getCurrentLatLong());
      await untilCalled(mockWeather.getAIQ(any));
      verify(mockWeather.getAIQ(any));
      verify(mockLocator.getCurrentLatLong());
    });

    test("GET AQI failure unable to get Location Permission", () async {
      //assert
      when(mockLocator.getCurrentLatLong()).thenAnswer(
        (_) async => Left(LocationPermissionFailure("permission failed")),
      );
      //expect Later - bloc states
      final expected = [
        AQILoading(),
        LocationPermissionError("permission failed"),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(FetchAQI());
      //verify calls
      await untilCalled(mockLocator.getCurrentLatLong());
      verify(mockLocator.getCurrentLatLong());
    });

    test("GET AQI failure unable to get Location Service", () async {
      //assert
      when(
        mockLocator.getCurrentLatLong(),
      ).thenAnswer((_) async => Left(LocationServiceFailure("service failed")));
      //expect Later - bloc states
      final expected = [AQILoading(), LocationServiceError("service failed")];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(FetchAQI());
      //verify calls
      await untilCalled(mockLocator.getCurrentLatLong());
      verify(mockLocator.getCurrentLatLong());
    });

    test("GET AQI failure weather API failed", () async {
      //assert
      when(
        mockLocator.getCurrentLatLong(),
      ).thenAnswer((_) async => Right(LatLong(lat: 15, lon: 15)));
      when(
        mockWeather.getAIQ(any),
      ).thenAnswer((_) async => Left(ServerFailure()));
      //expect Later - bloc states
      final expected = [AQILoading(), AQIFailed("Something went wrong")];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(FetchAQI());
      //verify calls
      await untilCalled(mockLocator.getCurrentLatLong());
      await untilCalled(mockWeather.getAIQ(any));
      verify(mockWeather.getAIQ(any));
      verify(mockLocator.getCurrentLatLong());
    });
  });
}
