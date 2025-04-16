import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../core/failure.dart';
import '../../domain/auth/auth_user.dart';
import '../../domain/auth/i_auth_facade.dart';
part 'auth_event.dart';
part 'auth_state.dart';

// ignore: constant_identifier_names
const SERVER_FAILURE = "Server failure";
// ignore: constant_identifier_names
const UNKNOWN_FAILURE = "Something went wrong";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade auth;
  AuthBloc({required this.auth}) : super(UnAuthenticated()) {
    on<SignInAnonymously>(_signInAnonymously);
    on<Logout>(_logOut);
  }

  FutureOr<void> _signInAnonymously(event, emit) async {
    emit(VerifyingAuth());
    final response = await auth.signInAnonymous();
    final state = response.fold(
      (failure) => AuthenticationFailed(_failureMsg(failure)),
      (authUser) => Authenticated(authUser),
    );
    emit(state);
  }

  FutureOr<void> _logOut(event, emit) async {
    emit(LoggingOut());
    final response = await auth.logOut();
    final state = response.fold(
      (failure) => LogutFailed(_failureMsg(failure)),
      (r) => UnAuthenticated(),
    );
    emit(state);
  }

  String _failureMsg(Failure failure) {
    final msg = switch (failure) {
      ServerFailure() => SERVER_FAILURE,
      UnknownFailure() => UNKNOWN_FAILURE,
      LocationPermissionFailure() => failure.msg,
      LocationServiceFailure() => failure.msg,
    };
    return msg;
  }
}
