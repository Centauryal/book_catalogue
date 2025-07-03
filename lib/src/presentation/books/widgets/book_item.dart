part of '../book_page.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final authors = bookModel.authors;
    final isAuthors = authors?.isEmpty == true || authors == null;
    final authorValue = isAuthors ? '-' : authors.first.name;
    return GestureDetector(
      onTap: () {
        /// TODO Go To Detail
      },
      child: Card(
        child: Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookModel.title ?? '-',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: DesignSystemTextStyle.current.body1Bold,
              ),
              SizedBox(height: 5.w),
              Text(
                authorValue ?? '-',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: DesignSystemTextStyle.current.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
