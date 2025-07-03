import 'package:book_catalogue/src/data/model/book/books_response.dart';

class JsonConvert {
  static T? fromJson<T>(Map<String, dynamic>? json) {
    if (json == null) return null;

    switch (T) {
      case BooksResponse:
        return BooksResponse.fromJson(json) as T;
    }

    return null;
  }
}
