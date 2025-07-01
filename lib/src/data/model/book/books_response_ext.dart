import '../../../domain/entities/book_model.dart';
import 'books_response.dart';

extension BooksResponseExt on BooksResponse {
  ListBookModel toDomain() {
    return ListBookModel(
      data: resultsBook
          ?.map(
            (e) => BookModel(
              id: e.id,
              title: e.title,
              authors: e.authors?.map((e) => e.toAuthorModel()).toList(),
              summaries: e.summaries,
              copyright: e.copyright,
              mediaType: e.mediaType,
              downloadCount: e.downloadCount,
            ),
          )
          .toList(),
    );
  }
}
