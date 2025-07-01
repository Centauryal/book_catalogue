import 'package:flutter/material.dart';

import '../presentation/blank/blank_page.dart';
import '../presentation/home/home_page.dart';
import 'route_names.dart';

class CustomRoute {
  static Route getRouteGenerate(RouteSettings settings) =>
      _routeGenerate(settings);

  static Route _routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const HomePage(),
        );
      default:
        return blankPage;
    }
  }

  static PageRouteBuilder blankPage = PageRouteBuilder(
    pageBuilder: (_, __, ___) => const BlankPage(),
  );
}
