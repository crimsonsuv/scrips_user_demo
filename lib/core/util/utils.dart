import 'dart:core';
import 'package:dio/dio.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';

String getRouteForHome(context) {
  return RoutePaths.Home;
}

Failure handleFailure(DioError e) {
  int responseCode = e.response.statusCode;
  if (isBetween(responseCode, 399, 499)) {
    return Failure("Request fields are missing.");
  } else if (isBetween(responseCode, 499, 600)) {
    return Failure(
        "Something bad happend in Server, please contact scrips support.");
  } else {
    return Failure(e?.message ?? "");
  }
}
