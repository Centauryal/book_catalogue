import 'package:flutter/material.dart';

class AppError {
  final Object? error;

  String? message;

  bool get hasNotError => error == null;

  bool get hasError => !hasNotError;

  AppError({this.error}) {
    if (error != null) {
      message = '[ERROR] AppError: $error';
    }

    if (message != null) {
      debugPrint(message);
    }
  }

  AppError copyWith({Object? error}) {
    return AppError(error: error ?? this.error);
  }
}
