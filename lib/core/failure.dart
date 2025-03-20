// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {}

class ServerFailure extends Failure {
  ServerFailure({required this.message});
  final String message;
}
