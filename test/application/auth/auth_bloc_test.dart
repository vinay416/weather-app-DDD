import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/application/auth/bloc/auth_bloc.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/domain/auth/auth_success.dart';

import 'auth_facade_mock.mocks.dart';

void main() {
  final auth = MockMyAuthFacade();
  AuthBloc bloc = AuthBloc(auth: auth);
  group("Auth bloc", () {
    test("initial state", () {
      expect(bloc.state, UnAuthenticated());
    });

    test("signInAnonymously Success", () async {
      //assert
      when(
        auth.signInAnonymous(),
      ).thenAnswer((_) async => Right(AuthSuccess()));
      // expect later
      final expected = [VerifyingAuth(), Authenticated()];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(SignInAnonymously());
      await untilCalled(auth.signInAnonymous());
      verify(auth.signInAnonymous());
    });

    test("signInAnonymously ServerFailure", () async {
      //assert
      when(
        auth.signInAnonymous(),
      ).thenAnswer((_) async => Left(ServerFailure()));
      // expect later
      final expected = [VerifyingAuth(), AuthenticationFailed("Server failure")];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(SignInAnonymously());
      await untilCalled(auth.signInAnonymous());
      verify(auth.signInAnonymous());
    });

      test("signInAnonymously UnknownFailure", () async {
      //assert
      when(
        auth.signInAnonymous(),
      ).thenAnswer((_) async => Left(UnknownFailure()));
      // expect later
      final expected = [VerifyingAuth(), AuthenticationFailed("Something went wrong")];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(SignInAnonymously());
      await untilCalled(auth.signInAnonymous());
      verify(auth.signInAnonymous());
    });
  });
}
