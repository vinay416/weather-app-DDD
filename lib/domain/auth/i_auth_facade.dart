import 'package:dartz/dartz.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/core/success.dart';

abstract class IAuthFacade {
  Future<Either<Failure,Success>> signInAnonymous();
}