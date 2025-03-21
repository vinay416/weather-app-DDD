import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([FirebaseAuthProvider])
class FirebaseAuthProvider extends Mock implements FirebaseAuth {}

class TestUserCredentails implements UserCredential {
  TestUserCredentails(this.mockUser);
  final User mockUser;
  @override
  AdditionalUserInfo? get additionalUserInfo =>
      AdditionalUserInfo(isNewUser: true);

  @override
  AuthCredential? get credential =>
      AuthCredential(providerId: "none", signInMethod: "Anonymous");

  @override
  User? get user => mockUser;
}

@GenerateMocks([MockAuthUser])
class MockAuthUser extends Mock implements User {}
