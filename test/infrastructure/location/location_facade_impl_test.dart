import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/infrastructure/core/lat_lon.dart';
import 'package:weather_app_ddd/infrastructure/location/location_facade_impl.dart';

import 'mock_location.mocks.dart';

void main() {
  final mockSource = MockMyLocationSource();
  final locationFacade = LocationFacadeImpl(mockSource);

  group("Location facade Impl", () {
    test("Location success", () async {
      //assert
      final expected = LatLong(lat: 15, lon: 15);
      when(mockSource.getCurrentLatLong()).thenAnswer((_) async => expected);
      //act
      final response = await locationFacade.getCurrentLatLong();
      //verify or expect
      verify(mockSource.getCurrentLatLong());
      expect(response, Right(expected));
    });

    test("Location failed", () async {
      //assert
      when(
        mockSource.getCurrentLatLong(),
      ).thenThrow(LocationPermissionException("any"));
      //act
      final response = await locationFacade.getCurrentLatLong();
      //verify or expect
      verify(mockSource.getCurrentLatLong());
      expect(response, Left(LocationPermissionFailure("any")));
    });
  });
}
