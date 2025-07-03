import 'book_model.dart';

class DetailModel {
  DetailModel({this.isAddedLiked = false, required this.bookModel});

  final bool isAddedLiked;
  final BookModel bookModel;
}
