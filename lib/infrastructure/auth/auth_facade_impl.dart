import 'package:dartz/dartz.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/domain/auth/auth_user.dart';
import 'package:weather_app_ddd/domain/auth/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFacadeImpl implements IAuthFacade {
  AuthFacadeImpl(this.firebaseAuth);
  final FirebaseAuth firebaseAuth;

  @override
  Future<Either<Failure, AuthUser>> signInAnonymous() async {
    try {
      final response = await firebaseAuth.signInAnonymously();
      final user = response.user;
      if (user == null) throw response;
      final authUser = AuthUser.fromUserCredential(user);
      return Right(authUser);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
