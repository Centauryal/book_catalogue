import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/data/utils/dio_provider.dart';
import 'src/presentation/book_catalogue_app/book_catalogue_app.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Api
      ApiProvider.init();

      /// Device Orientation
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      runApp(BookCatalogueApp());
    },
    (error, stack) {
      debugPrint('run zoned guarded, error: $error, stackTrace: $stack');
    },
  );
}
