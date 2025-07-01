import '../../data/utils/result_response/app_error.dart';

/// Pattern for [Repository]'s return model
class AppStateResult<T, T2> {
  AppStateResult({
    required this.data,
    required this.information,
    required this.error,
  });

  /// restricted for [BaseDomain] only.
  final T? data;

  /// restricted for [ResultInformation] only.
  final T2? information;

  /// restricted for [AppError] only
  final AppError? error;
}
