import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/core/failure.dart';
import 'package:weather_app_ddd/domain/auth/auth_user.dart';
import 'package:weather_app_ddd/infrastructure/auth/auth_facade_impl.dart';

import 'mock_firebase_auth_provider.dart';
import 'mock_firebase_auth_provider.mocks.dart';

class AnonymousUser extends MockAuthUser {
  @override
  String get uid => "1";

  @override
  bool get isAnonymous => true;
}

void main() {
  final mockFirebaseAuth = MockFirebaseAuthProvider();
  final auth = AuthFacadeImpl(mockFirebaseAuth);

  final anonymousUser = AnonymousUser();

  group("SignInAnonymously", () {
    test("SignInAnonymously Success", () async {
      //assert
      when(
        mockFirebaseAuth.signInAnonymously(),
      ).thenAnswer((_) async => (TestUserCredentails(anonymousUser)));
      //act
      final response = await auth.signInAnonymous();
      //verify
      final expected = AuthUser.fromUserCredential(anonymousUser);
      expect(response, equals(Right(expected)));
      verify(mockFirebaseAuth.signInAnonymously());
    });

    test("SignInAnonymously Failed", () async {
      //assert
      when(
        mockFirebaseAuth.signInAnonymously(),
      ).thenThrow(FirebaseAuthException(code: "-1"));
      //act
      final response = await auth.signInAnonymous();
      //verify
      final expected = ServerFailure();
      expect(response, Left(expected));
      verify(mockFirebaseAuth.signInAnonymously());
    });
  });
}
