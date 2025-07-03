part of '../book_page.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.bookModel, this.isLiked = false});

  final BookModel bookModel;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    final authors = bookModel.authors;
    final authorIsLiked = bookModel.author;
    final isAuthors = authors?.isEmpty == true || authors == null;
    final authorRemote = isAuthors ? '-' : authors.first.name;

    final authorValue = isLiked ? authorIsLiked : authorRemote;
    return GestureDetector(
      onTap: () async {
        final detailModel = DetailModel(
          isAddedLiked: isLiked,
          bookModel: bookModel,
        );
        LikedViewModel? viewModel;
        if (isLiked) {
          viewModel = context.read<LikedViewModel>();
        }
        await Navigator.pushNamed(
          context,
          RouteNames.detail,
          arguments: detailModel,
        );

        if (isLiked) {
          viewModel?.getLikedBook();
        }
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
