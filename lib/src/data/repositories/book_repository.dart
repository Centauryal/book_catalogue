import '../../domain/entities/book_model.dart';
import '../../domain/entities/restful_result_information.dart';
import '../../utils/app_state/app_state_result.dart';
import '../model/book/books_response.dart';
import '../model/book/books_response_ext.dart';
import '../utils/endpoints.dart';
import '../utils/restful_client_provider.dart';
import '../utils/restful_clients.dart';
import '../utils/result_response/app_error.dart';

class BookRepository {
  Future<AppStateResult<ListBookModel, RestfulResultInformation>> getBooks({
    int page = 1,
  }) async {
    try {
      final response =
          await RestfulClientProvider.getResultResponseRestful<BooksResponse>(
            MethodRestful.get,
            Endpoints.books,
            queryParameters: {'page': page.toString()},
          );

      final domain = response.data?.toDomain();
      var error = response.appError;

      return AppStateResult(data: domain, information: null, error: error);
    } catch (e) {
      return AppStateResult(
        data: null,
        information: null,
        error: AppError(error: e),
      );
    }
  }
}
