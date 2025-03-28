import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class Exceptions extends Equatable {
  const Exceptions([properties]);
  final List properties = const <dynamic>[];

  @override
  List<Object> get props => [properties];
}

class ServerException extends Exceptions {}

class CacheException extends Exceptions {}
