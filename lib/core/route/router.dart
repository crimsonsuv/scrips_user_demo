import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrips_ua/core/route/app_route_paths.dart';
import 'package:scrips_ua/features/PatientList/presentation/pages/base_screen.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/pages/base_screen.dart';
import 'package:scrips_ua/features/Signup/presentation/pages/base_screen.dart';
import 'package:scrips_ua/features/landing/presentation/pages/base_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePaths.Landing:
        return MaterialPageRoute(
            builder: (_) => LandingBaseScreen(
                  key: ObjectKey(settings.name),
                  // next: homeView(settings),
                ),
            settings: RouteSettings(name: settings.name));
        break;
      case AppRoutePaths.SignUp:
        return MaterialPageRoute(
            builder: (_) => SignupBaseScreen(
                  key: ObjectKey(settings.name),
                  // next: homeView(settings),
                ),
            settings: RouteSettings(name: settings.name));
        break;
      case AppRoutePaths.PatientList:
        return MaterialPageRoute(
            builder: (_) => PatientListBaseScreen(
                key: ObjectKey(settings.name), patientList: settings.arguments
                // next: homeView(settings),
                ),
            settings: RouteSettings(name: settings.name));
        break;
      case AppRoutePaths.Questionnaire:
        return MaterialPageRoute(
            builder: (_) => QuestionnaireBaseScreen(
                key: ObjectKey(settings.name), patientId: settings.arguments
                // next: homeView(settings),
                ),
            settings: RouteSettings(name: settings.name));
        break;
    }
  }
}
