import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUser extends Equatable {
  final bool isGuest;
  final String name;
  final String email;
  final String id;
  final String dpUrl;
  const AuthUser({
    required this.isGuest,
    required this.name,
    required this.email,
    required this.id,
    required this.dpUrl,
  });

  factory AuthUser.fromUserCredential(User user) {
    final name = user.displayName ?? "";
    final email = user.email ?? "";
    final id = user.uid;
    final isGuest = user.isAnonymous;
    final dpUrl = user.photoURL ?? "";
    return AuthUser(
      isGuest: isGuest,
      name: name,
      email: email,
      id: id,
      dpUrl: dpUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isGuest': isGuest,
      'name': name,
      'email': email,
      'id': id,
      'dpUrl': dpUrl,
    };
  }

  @override
  List<Object?> get props => [isGuest, id, name, email, dpUrl];
}
