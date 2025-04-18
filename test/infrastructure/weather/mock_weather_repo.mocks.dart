// Mocks generated by Mockito 5.4.5 from annotations
// in weather_app_ddd/test/infrastructure/weather/mock_weather_repo.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_app_ddd/core/weather/lat_lon.dart' as _i5;
import 'package:weather_app_ddd/infrastructure/weather/aqi.dart' as _i2;

import 'mock_weather_repo.dart' as _i3;

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

class _FakeAQI_0 extends _i1.SmartFake implements _i2.AQI {
  _FakeAQI_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [WeatherRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepo extends _i1.Mock implements _i3.WeatherRepo {
  MockWeatherRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AQI> getAIQ(_i5.LatLong? latlong) =>
      (super.noSuchMethod(
            Invocation.method(#getAIQ, [latlong]),
            returnValue: _i4.Future<_i2.AQI>.value(
              _FakeAQI_0(this, Invocation.method(#getAIQ, [latlong])),
            ),
          )
          as _i4.Future<_i2.AQI>);
}
