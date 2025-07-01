import '../../data/utils/result_response/app_error.dart';

class AppStateLoading<T, InformationResponse>
    extends AppState<T, InformationResponse> {
  const AppStateLoading() : super._();
}

class AppStateFailure<T, Information> extends AppState<T, Information> {
  const AppStateFailure({this.data, this.information, required this.error})
    : super._();

  final T? data;
  final Information? information;
  final AppError error;
}

class AppStateSuccess<T, Information> extends AppState<T, Information> {
  final T? data;
  final Information? information;
  final AppError? appError;

  bool get hasError => appError != null;

  const AppStateSuccess({
    required this.data,
    required this.information,
    this.appError,
  }) : super._();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppStateSuccess<T, Information> &&
        other.data == data &&
        other.appError == appError;
  }

  @override
  int get hashCode => data.hashCode ^ appError.hashCode;
}

class AppState<T, Information> {
  const AppState._();

  factory AppState.success({
    required T? data,
    required Information? information,
  }) = AppStateSuccess;

  factory AppState.failure({
    T? data,
    required AppError error,
    Information? information,
  }) = AppStateFailure;

  factory AppState.loading() = AppStateLoading;
}
