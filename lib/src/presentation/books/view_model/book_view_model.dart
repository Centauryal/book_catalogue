import 'package:flutter/foundation.dart';

import '../../../data/repositories/book_repository.dart';
import '../../../data/utils/result_response/app_error.dart';
import '../../../domain/entities/book_model.dart';
import '../../../utils/mvvm/base_view_model.dart';

class BookViewModel extends BaseViewModel {
  BookViewModel({required this.repository});

  @override
  Future<void> init() async {
    super.init();

    await getListBook();
  }

  final BookRepository repository;

  int _currentPage = 1;
  bool _isLastPage = false;
  bool _isLoading = false;

  List<BookModel>? _listBookModel;

  bool get isLoading => _isLoading;
  bool get isLastPage => _isLastPage;

  List<BookModel>? get listBookModel => _listBookModel;

  Future<void> getListBook({bool loadMore = false}) async {
    if (_isLoading || _isLastPage) return;

    _isLoading = true;

    final pageToRequest = loadMore ? _currentPage + 1 : 1;

    try {
      final response = await repository.getBooks(page: pageToRequest);

      final data = response.data;

      if (loadMore) {
        _listBookModel = [...?_listBookModel, ...?data?.data];
        _currentPage++;
      } else {
        _listBookModel = data?.data?.toList();
        _currentPage = 1;
      }

      _isLastPage = data?.next?.isEmpty == true;
    } on AppError catch (e) {
      debugPrint('error AppError get list book, $e');
    } catch (e) {
      debugPrint('error catch get list book, ${AppError(error: e)}');
    }

    _isLoading = false;
    notifyListeners();
  }
}
