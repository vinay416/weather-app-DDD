import 'package:equatable/equatable.dart';

abstract class Errors extends Equatable {
  const Errors([properties]);
  final List properties = const <dynamic>[];

  @override
  List<Object> get props => [properties];
}

class ValidationError extends Errors{
  const ValidationError(this.errorMsg);
  final String errorMsg;

  @override
  List<Object> get props => [errorMsg];
}