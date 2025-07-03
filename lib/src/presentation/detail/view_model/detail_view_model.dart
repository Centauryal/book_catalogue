import 'package:flutter/foundation.dart';

import '../../../data/repositories/liked_repository.dart';
import '../../../data/utils/result_response/app_error.dart';
import '../../../domain/entities/book_model.dart';
import '../../../utils/mvvm/base_view_model.dart';

class DetailViewModel extends BaseViewModel {
  DetailViewModel({required this.repository, required this.bookModel});

  final LikedRepository repository;
  final BookModel bookModel;

  bool _isAddedLiked = false;

  bool get isAddedLiked => _isAddedLiked;

  @override
  Future<void> init() async {
    super.init();

    await toggleLiked(bookModel.id ?? 0);
  }

  Future<String?> saveLikedBook(BookModel book) async {
    try {
      final response = await repository.insertLiked(book);
      await toggleLiked(book.id ?? 0);
      return response;
    } catch (e) {
      debugPrint('error catch get liked book, ${AppError(error: e)}');
      return null;
    }
  }

  Future<String?> removeLikedBook(BookModel book) async {
    try {
      final response = await repository.removeLiked(book);
      await toggleLiked(book.id ?? 0);
      return response;
    } catch (e) {
      debugPrint('error catch get liked book, ${AppError(error: e)}');
      return null;
    }
  }

  Future<void> toggleLiked(int id) async {
    _isAddedLiked = await isAddedToLiked(id);
    notifyListeners();
  }

  Future<bool> isAddedToLiked(int id) async {
    final result = await repository.getLikedById(id);
    return result != null;
  }
}
