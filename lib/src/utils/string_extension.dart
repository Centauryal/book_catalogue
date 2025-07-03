import 'package:html_unescape/html_unescape.dart';

extension StringExtension on String {
  String decodeApiHtml() {
    final unescape = HtmlUnescape();
    return unescape.convert(this);
  }
}
