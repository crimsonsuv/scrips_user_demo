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

String groupIcon(String name) {
  switch (name) {
    case "Patient":
    case "Gender":
      return "ic_patient";
      break;
    case "Conditions":
      return "ic_conditions";
      break;
    case "Life Style":
      return "ic_lifestyle";
      break;
    case "Allergies":
    case "Food Allergies":
      return "ic_allergy";
      break;
    case "Medications":
      return "ic_medication";
      break;
    default:
      return "ic_patient";
  }
}

const stringQType = "String";
const booleanQType = "Boolean";
const choiceQType = "Choice";
const openChoiceQType = "OpenChoice";
const groupQType = "Group";
