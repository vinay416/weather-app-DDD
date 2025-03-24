part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {}

// UnAuthenticated [Login/Signup State]
final class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// VerifyingAuth [Loading State]
final class VerifyingAuth extends AuthState {
  @override
  List<Object?> get props => [];
}

// AuthenticationFailed [Login/Signup failed]
final class AuthenticationFailed extends AuthState {
  AuthenticationFailed(this.errorMsg);
  final String errorMsg;
  @override
  List<Object?> get props => [errorMsg];
}

// Authenticated [Login/Signup Success]
final class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// LoggingOut [Logout Success]
final class LoggingOut extends AuthState {
  @override
  List<Object?> get props => [];
}

// LoggingOut [Logout Failed]
final class LogutFailed extends AuthState {
  LogutFailed(this.msg);
  final String msg;
  @override
  List<Object?> get props => [msg];
}
