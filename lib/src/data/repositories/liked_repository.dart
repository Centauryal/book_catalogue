import 'package:book_catalogue/src/data/persistance/database_helper.dart';
import 'package:book_catalogue/src/domain/entities/book_model.dart';

class LikedRepository {
  LikedRepository({required this.databaseHelper});

  final DatabaseHelper databaseHelper;

  Future<String> insertLiked(BookModel book) async {
    try {
      await databaseHelper.insertLiked(book);
      return 'Added to Liked';
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> removeLiked(BookModel book) async {
    try {
      await databaseHelper.removeLiked(book);
      return 'Removed from Liked';
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<BookModel?> getLikedById(int id) async {
    final result = await databaseHelper.getLikedById(id);
    if (result != null) {
      return BookModel.fromMap(result);
    } else {
      return null;
    }
  }

  Future<List<BookModel>> getLikedBooks() async {
    final result = await databaseHelper.getLikedBooks();
    return result.map((data) => BookModel.fromMap(data)).toList();
  }
}
