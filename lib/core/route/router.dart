import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrips_shared_features/features/landing/presentation/pages/base_screen.dart';
import 'package:scrips_ua/core/route/app_route_paths.dart';

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
    }
  }
}
