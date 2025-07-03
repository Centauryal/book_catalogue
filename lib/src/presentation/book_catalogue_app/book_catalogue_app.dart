import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

import '../../../generated/l10n.dart';
import '../../navigator/custom_route.dart';
import '../../utils/route_observer.dart';
import '../../utils/themes/app_themes.dart';
import '../../utils/themes/design_system_text_style.dart';
import '../home/home_page.dart';

class BookCatalogueApp extends StatelessWidget {
  const BookCatalogueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        DesignSystemTextStyle.init(context);

        return MaterialApp(
          title: 'Book Catalogue',
          navigatorObservers: [NavigationHistoryObserver(), routeObserver],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: appTheme(),
          darkTheme: ThemeData.dark(),
          onGenerateRoute: CustomRoute.getRouteGenerate,
          home: const HomePage(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.noScaling),
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
