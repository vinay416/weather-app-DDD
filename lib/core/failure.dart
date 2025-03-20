// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
sealed class Failure {}

class ServerFailure extends Failure {}

class UnknownFailure extends Failure {}
