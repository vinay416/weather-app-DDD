// Mocks generated by Mockito 5.4.5 from annotations
// in weather_app_ddd/test/infrastructure/location/mock_location.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i7;

import 'package:location/location.dart' as _i2;
import 'package:location_platform_interface/location_platform_interface.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_app_ddd/infrastructure/core/lat_lon.dart' as _i3;

import 'mock_location.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLocationData_0 extends _i1.SmartFake implements _i2.LocationData {
  _FakeLocationData_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLatLong_1 extends _i1.SmartFake implements _i3.LatLong {
  _FakeLatLong_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MyLocator].
///
/// See the documentation for Mockito's code generation for more information.
class MockMyLocator extends _i1.Mock implements _i4.MyLocator {
  MockMyLocator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<_i2.LocationData> get onLocationChanged =>
      (super.noSuchMethod(
            Invocation.getter(#onLocationChanged),
            returnValue: _i5.Stream<_i2.LocationData>.empty(),
          )
          as _i5.Stream<_i2.LocationData>);

  @override
  _i5.Future<bool> changeSettings({
    _i2.LocationAccuracy? accuracy = _i2.LocationAccuracy.high,
    int? interval = 1000,
    double? distanceFilter = 0.0,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#changeSettings, [], {
              #accuracy: accuracy,
              #interval: interval,
              #distanceFilter: distanceFilter,
            }),
            returnValue: _i5.Future<bool>.value(false),
          )
          as _i5.Future<bool>);

  @override
  _i5.Future<bool> isBackgroundModeEnabled() =>
      (super.noSuchMethod(
            Invocation.method(#isBackgroundModeEnabled, []),
            returnValue: _i5.Future<bool>.value(false),
          )
          as _i5.Future<bool>);

  @override
  _i5.Future<bool> enableBackgroundMode({bool? enable = true}) =>
      (super.noSuchMethod(
            Invocation.method(#enableBackgroundMode, [], {#enable: enable}),
            returnValue: _i5.Future<bool>.value(false),
          )
          as _i5.Future<bool>);

  @override
  _i5.Future<_i2.LocationData> getLocation() =>
      (super.noSuchMethod(
            Invocation.method(#getLocation, []),
            returnValue: _i5.Future<_i2.LocationData>.value(
              _FakeLocationData_0(this, Invocation.method(#getLocation, [])),
            ),
          )
          as _i5.Future<_i2.LocationData>);

  @override
  _i5.Future<_i2.PermissionStatus> hasPermission() =>
      (super.noSuchMethod(
            Invocation.method(#hasPermission, []),
            returnValue: _i5.Future<_i2.PermissionStatus>.value(
              _i2.PermissionStatus.granted,
            ),
          )
          as _i5.Future<_i2.PermissionStatus>);

  @override
  _i5.Future<_i2.PermissionStatus> requestPermission() =>
      (super.noSuchMethod(
            Invocation.method(#requestPermission, []),
            returnValue: _i5.Future<_i2.PermissionStatus>.value(
              _i2.PermissionStatus.granted,
            ),
          )
          as _i5.Future<_i2.PermissionStatus>);

  @override
  _i5.Future<bool> serviceEnabled() =>
      (super.noSuchMethod(
            Invocation.method(#serviceEnabled, []),
            returnValue: _i5.Future<bool>.value(false),
          )
          as _i5.Future<bool>);

  @override
  _i5.Future<bool> requestService() =>
      (super.noSuchMethod(
            Invocation.method(#requestService, []),
            returnValue: _i5.Future<bool>.value(false),
          )
          as _i5.Future<bool>);

  @override
  _i5.Future<_i6.AndroidNotificationData?> changeNotificationOptions({
    String? channelName,
    String? title,
    String? iconName,
    String? subtitle,
    String? description,
    _i7.Color? color,
    bool? onTapBringToFront,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#changeNotificationOptions, [], {
              #channelName: channelName,
              #title: title,
              #iconName: iconName,
              #subtitle: subtitle,
              #description: description,
              #color: color,
              #onTapBringToFront: onTapBringToFront,
            }),
            returnValue: _i5.Future<_i6.AndroidNotificationData?>.value(),
          )
          as _i5.Future<_i6.AndroidNotificationData?>);
}

/// A class which mocks [MyLocationSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMyLocationSource extends _i1.Mock implements _i4.MyLocationSource {
  MockMyLocationSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.LatLong> getCurrentLatLong() =>
      (super.noSuchMethod(
            Invocation.method(#getCurrentLatLong, []),
            returnValue: _i5.Future<_i3.LatLong>.value(
              _FakeLatLong_1(this, Invocation.method(#getCurrentLatLong, [])),
            ),
          )
          as _i5.Future<_i3.LatLong>);
}
