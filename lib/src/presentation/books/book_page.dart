import 'package:book_catalogue/src/presentation/blank/blank_page.dart';
import 'package:book_catalogue/src/presentation/books/view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/book_repository.dart';
import '../../domain/entities/book_model.dart';
import '../../utils/mvvm/components/mvvm_builder.dart';
import '../../utils/themes/design_system_text_style.dart';

part 'widgets/book_item.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  BookViewModel? viewModel;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MvvmBuilder(
      key: const ValueKey('book-page'),
      viewModel: BookViewModel(repository: BookRepository()),
      view: (context) {
        viewModel = context.read<BookViewModel>();

        final bookModel = context.select(
          (BookViewModel vm) => vm.listBookModel,
        );

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (viewModel?.isLoading == false &&
                viewModel?.isLastPage == false &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              viewModel?.getListBook(loadMore: true);
            }
            return false;
          },
          child: viewModel?.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 16.w,
                  ),
                  itemCount: bookModel?.length ?? 0,
                  separatorBuilder: (_, __) => SizedBox(width: 8.w),
                  itemBuilder: (context, index) {
                    final bookItem = bookModel?[index];

                    if (bookItem == null || bookModel?.isEmpty == true) {
                      return const BlankPage();
                    }

                    return BookItem(bookModel: bookItem);
                  },
                ),
        );
      },
    );
  }
}
