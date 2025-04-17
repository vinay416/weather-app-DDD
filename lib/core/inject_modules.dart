import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@module
abstract class RegisterModule {
  Location get locator => Location.instance;
  Dio get dio => Dio(
    BaseOptions(
      contentType: ContentType.json.toString(),
      responseType: ResponseType.json,
    ),
  );
}
