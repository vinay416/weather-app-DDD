part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignInAnonymously extends AuthEvent {}
