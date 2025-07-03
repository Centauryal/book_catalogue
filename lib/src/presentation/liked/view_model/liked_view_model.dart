import 'package:book_catalogue/src/data/repositories/liked_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../data/utils/result_response/app_error.dart';
import '../../../domain/entities/book_model.dart';
import '../../../utils/mvvm/base_view_model.dart';

class LikedViewModel extends BaseViewModel {
  LikedViewModel({required this.repository});

  final LikedRepository repository;

  List<BookModel>? _listLikedBookModel;

  List<BookModel>? get listLikedBookModel => _listLikedBookModel;

  @override
  Future<void> init() async {
    super.init();

    getLikedBook();
  }

  Future<void> getLikedBook() async {
    try {
      final response = await repository.getLikedBooks();
      _listLikedBookModel = response.toList();
    } catch (e) {
      debugPrint('error catch get liked book, ${AppError(error: e)}');
    }
    notifyListeners();
  }
}
