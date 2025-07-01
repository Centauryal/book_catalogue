import '../../data/utils/result_response/result_information.dart';

class RestfulResultInformation extends ResultInformation {
  const RestfulResultInformation({
    required super.message,
    required this.error,
    required this.code,
    required super.status,
  });

  final String? error;
  final String? code;
}
