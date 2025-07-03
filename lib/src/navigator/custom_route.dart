import 'package:flutter/material.dart';

import '../domain/entities/book_model.dart';
import '../presentation/blank/blank_page.dart';
import '../presentation/detail/detail_page.dart';
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
      case RouteNames.detail:
        if (settings.arguments is! BookModel) {
          return blankPage;
        }
        var arguments = settings.arguments as BookModel;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => DetailPage(bookModel: arguments),
        );
      default:
        return blankPage;
    }
  }

  static PageRouteBuilder blankPage = PageRouteBuilder(
    pageBuilder: (_, __, ___) => const BlankPage(),
  );
}
