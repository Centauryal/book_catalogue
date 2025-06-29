import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'src/data/utils/dio_provider.dart';
import 'src/presentation/book_catalogue_app/book_catalogue_app.dart';
import 'src/utils/device_screen_type.dart';

void main() async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      /// Api
      ApiProvider.init();

      /// Get Device Type
      await AppDeviceScreenType.init();

      final screen = AppDeviceScreenType();
      final type = screen.type;

      /// Device Orientation
      if (type.isTablet) {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      } else {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
      runApp(const BookCatalogueApp());
    },
    (error, stack) {
      debugPrint('run zoned guarded, error: $error, stackTrace: $stack');
    },
  );
}
