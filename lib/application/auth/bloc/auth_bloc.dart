import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../core/failure.dart';
import '../../../domain/auth/i_auth_facade.dart';
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
  }

  FutureOr<void> _signInAnonymously(event, emit) async {
    emit(VerifyingAuth());
    final response = await auth.signInAnonymous();
    final state = response.fold(
      (failure) => AuthenticationFailed(_failureMsg(failure)),
      (success) => Authenticated(),
    );
    emit(state);
  }

  String _failureMsg(Failure failure) {
    final msg = switch (failure) {
      ServerFailure() => SERVER_FAILURE,
      UnknownFailure() => UNKNOWN_FAILURE,
    };
    return msg;
  }
}
