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

class LocationPermissionException extends Exceptions {
  const LocationPermissionException(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}

class LocationServiceException extends Exceptions {
  const LocationServiceException(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}
