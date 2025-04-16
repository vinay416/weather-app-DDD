import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/core/exceptions.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';
import 'package:weather_app_ddd/infrastructure/location/location_data_source.dart';

import 'mock_location.mocks.dart';

void main() {
  final mockLocator = MockMyLocator();
  final location = LocationDataSourceImpl(locator: mockLocator);

  group("Location Facade impl", () {
    test("Location Permission granted", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
      //act
      await location.getCurrentLatLong();
      //verify or expect
      verify(mockLocator.hasPermission());
    });

    test("Location Permission granted limited", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.grantedLimited);
      //act
      await location.getCurrentLatLong();
      //verify or expect
      verify(mockLocator.hasPermission());
    });

    test("Location Permission not granted, on request success", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.denied);
      when(
        mockLocator.requestPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
      //act
      await location.getCurrentLatLong();
      //verify or expect
      verify(mockLocator.hasPermission());
      verify(mockLocator.requestPermission());
    });

    test("Location Permission not granted, on request -> denied", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.denied);
      when(
        mockLocator.requestPermission(),
      ).thenAnswer((_) async => PermissionStatus.denied);
      //act
      final call = location.getCurrentLatLong();
      //verify or expect
      expect(
        () async => await call,
        throwsA(TypeMatcher<LocationPermissionException>()),
      );
      await untilCalled(mockLocator.hasPermission());
      await untilCalled(mockLocator.requestPermission());
      verify(mockLocator.hasPermission());
      verify(mockLocator.requestPermission());
    });

    test(
      "Location Permission not granted, on request -> permanently denied",
      () async {
        //assert
        when(
          mockLocator.hasPermission(),
        ).thenAnswer((_) async => PermissionStatus.denied);
        when(
          mockLocator.requestPermission(),
        ).thenAnswer((_) async => PermissionStatus.deniedForever);
        //act
        final call = location.getCurrentLatLong();
        //verify or expect
        expect(
          () async => await call,
          throwsA(TypeMatcher<LocationPermissionException>()),
        );
        await untilCalled(mockLocator.hasPermission());
        await untilCalled(mockLocator.requestPermission());
        verify(mockLocator.hasPermission());
        verify(mockLocator.requestPermission());
      },
    );

    test("Location Permission permanently denied", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.deniedForever);
      //act
      final call = location.getCurrentLatLong();
      //verify or expect
      verify(mockLocator.hasPermission());
      expect(
        () async => await call,
        throwsA(TypeMatcher<LocationPermissionException>()),
      );
    });

    test("Location service granted", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
      when(mockLocator.serviceEnabled()).thenAnswer((_) async => true);
      //act
      await location.getCurrentLatLong();
      //verify or expect
      verify(mockLocator.hasPermission());
      verify(mockLocator.serviceEnabled());
    });

    test("Location service denied, request success", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
      when(mockLocator.serviceEnabled()).thenAnswer((_) async => false);
      when(mockLocator.requestService()).thenAnswer((_) async => true);
      //act
      await location.getCurrentLatLong();
      //verify or expect
      verify(mockLocator.hasPermission());
      verify(mockLocator.serviceEnabled());
      verify(mockLocator.requestService());
    });

    test("Location service denied, request denied", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
      when(mockLocator.serviceEnabled()).thenAnswer((_) async => false);
      when(mockLocator.requestService()).thenAnswer((_) async => false);
      //act
      final call = location.getCurrentLatLong();
      //verify or expect
      expect(
        () async => await call,
        throwsA(TypeMatcher<LocationPermissionException>()),
      );
      await untilCalled(mockLocator.hasPermission());
      await untilCalled(mockLocator.serviceEnabled());
      await untilCalled(mockLocator.requestService());
      verify(mockLocator.hasPermission());
      verify(mockLocator.serviceEnabled());
      verify(mockLocator.requestService());
    });

    test("Get latlong of current-location Success", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
      when(mockLocator.serviceEnabled()).thenAnswer((_) async => true);
      when(mockLocator.getLocation()).thenAnswer(
        (_) async =>
            LocationData.fromMap({'latitude': 15.0, 'longitude': 15.0}),
      );
      //act
      final latlon = await location.getCurrentLatLong();
      //verify or expect
      await untilCalled(mockLocator.hasPermission());
      await untilCalled(mockLocator.serviceEnabled());
      verify(mockLocator.getLocation());
      expect(latlon, LatLong(lat: 15.0, lon: 15.0));
    });

    test("Get latlong of current-location Failed", () async {
      //assert
      when(
        mockLocator.hasPermission(),
      ).thenAnswer((_) async => PermissionStatus.granted);
      when(mockLocator.serviceEnabled()).thenAnswer((_) async => true);
      when(mockLocator.getLocation()).thenAnswer(
        (_) async =>
            LocationData.fromMap({'latitude': 15.0, 'longitude': null}),
      );
      //act
      final call = location.getCurrentLatLong();
      //verify or expect
      expect(
        () async => await call,
        throwsA(TypeMatcher<LocationPermissionException>()),
      );
      await untilCalled(mockLocator.hasPermission());
      await untilCalled(mockLocator.serviceEnabled());
      verify(mockLocator.getLocation());
    });
  });
}
