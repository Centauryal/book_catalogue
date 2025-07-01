import 'package:flutter/widgets.dart';

import '../../data/utils/result_response/app_error.dart';
import '../../data/utils/result_response/result_information.dart';
import 'app_state.dart';

typedef WidgetDataNull<Information extends ResultInformation?> =
    Widget Function(Information? information);

typedef WidgetSuccess<T, Information extends ResultInformation?> =
    Widget Function(T data, Information information);

typedef WidgetFailure<T, Information extends ResultInformation?> =
    Widget Function(AppError? error, T? data, Information? information);

class AppStateBuilder<T, Information extends ResultInformation?>
    extends StatelessWidget {
  const AppStateBuilder({
    super.key,
    required this.response,
    this.whenLoading,
    required this.whenDataNull,
    required this.whenSuccess,
    required this.whenError,
  });

  final AppState<T, Information>? response;
  final Widget? whenLoading;
  final WidgetDataNull<Information> whenDataNull;
  final WidgetSuccess<T, Information> whenSuccess;
  final WidgetFailure<T, Information> whenError;

  @override
  Widget build(BuildContext context) {
    if (response == null) {
      return whenDataNull(null);
    }

    if (response is AppStateLoading) {
      return whenLoading ?? const SizedBox();
    }

    if (response is AppStateFailure) {
      final resp = response as AppStateFailure;
      return whenError(resp.error, resp.data, resp.information);
    }

    final resp = response as AppStateSuccess;

    if (resp.data == null) {
      return whenDataNull(resp.information);
    }
    return whenSuccess(resp.data, resp.information);
  }
}
