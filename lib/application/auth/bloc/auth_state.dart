part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {}

final class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

final class VerifyingAuth extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthenticationFailed extends AuthState {
  AuthenticationFailed(this.errorMsg);
  final String errorMsg;
  @override
  List<Object?> get props => [errorMsg];
}

final class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}
