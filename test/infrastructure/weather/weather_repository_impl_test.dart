import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/core/lat_lon.dart';
import 'package:weather_app_ddd/infrastructure/weather/aqi.dart';
import 'package:weather_app_ddd/infrastructure/weather/weather_repository_impl.dart';

import '../../core/mock_dio.mocks.dart';
import '../../fixtures/aqi_fixture.dart';

void main() {
  final mockDio = MockMyDio();
  final repo = WeatherRepositoryImpl(mockDio);

  setUp(() {
    when(mockDio.options).thenReturn(BaseOptions(baseUrl: WEATHER_BASE_URL));
  });

  group("Weather Remote/Repo tests", () {
    test("check base Url", () {
      expect(mockDio.options.baseUrl, WEATHER_BASE_URL);
    });

    test("Fetch AQI -> Success", () async {
      //assert
      const LatLong latlong = (lat: 50, lon: 50);
      final latlongParam = {
        "lat": latlong.lat,
        "lon": latlong.lon,
        "appid": APP_ID,
      };
      when(mockDio.get(any, queryParameters: latlongParam)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(contentType: "application/json"),
          data: (AQI_FIXTURE),
          statusCode: 200,
        ),
      );
      //act
      final response = await repo.getAIQ(latlong);
      //verify
      verify(mockDio.get(any, queryParameters: latlongParam));
      final expected = AQI.fromJson(AQI_FIXTURE);
      expect(response, expected);
    });
  });
}
