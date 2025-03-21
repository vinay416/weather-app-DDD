import 'package:dartz/dartz.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/domain/auth/auth_user.dart';

abstract class IAuthFacade {
  Future<Either<Failure, AuthUser>> signInAnonymous();
}
