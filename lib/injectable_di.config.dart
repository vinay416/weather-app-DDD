// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:location/location.dart' as _i645;

import 'application/weather/aqi/aqi_bloc.dart' as _i336;
import 'core/inject_modules.dart' as _i195;
import 'domain/location/i_location_facade.dart' as _i276;
import 'domain/weather/i_weather_facade.dart' as _i604;
import 'domain/weather/i_weather_repository.dart' as _i594;
import 'infrastructure/location/location_data_source.dart' as _i1071;
import 'infrastructure/location/location_facade_impl.dart' as _i109;
import 'infrastructure/weather/weather_facade_impl.dart' as _i533;
import 'infrastructure/weather/weather_repository_impl.dart' as _i28;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i645.Location>(() => registerModule.locator);
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i594.IWeatherRepository>(
      () => _i28.WeatherRepositoryImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i604.IWeatherFacade>(
      () => _i533.WeatherFacadeImpl(gh<_i594.IWeatherRepository>()),
    );
    gh.lazySingleton<_i1071.LocationDataSource>(
      () => _i1071.LocationDataSourceImpl(locator: gh<_i645.Location>()),
    );
    gh.lazySingleton<_i276.ILocationFacade>(
      () => _i109.LocationFacadeImpl(gh<_i1071.LocationDataSource>()),
    );
    gh.factory<_i336.AQIBloc>(
      () => _i336.AQIBloc(
        locator: gh<_i276.ILocationFacade>(),
        weather: gh<_i604.IWeatherFacade>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i195.RegisterModule {}
