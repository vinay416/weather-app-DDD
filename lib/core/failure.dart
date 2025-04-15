// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class Failure extends Equatable {
  const Failure([properties]);
  final List properties = const <dynamic>[];

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {}

class UnknownFailure extends Failure {}

class LocationFailure extends Failure {
  const LocationFailure(this.msg);
  final String msg;

  @override
  List<Object> get props => [properties, msg];
}
