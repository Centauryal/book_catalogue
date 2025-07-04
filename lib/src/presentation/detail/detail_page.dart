import 'package:book_catalogue/src/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../data/persistance/database_helper.dart';
import '../../data/repositories/liked_repository.dart';
import '../../domain/entities/detail_model.dart';
import '../../utils/mvvm/components/mvvm_builder.dart';
import '../../utils/themes/design_system_color.dart';
import '../../utils/themes/design_system_text_style.dart';
import 'view_model/detail_view_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.detailModel});

  final DetailModel detailModel;

  @override
  Widget build(BuildContext context) {
    final isAddLiked = detailModel.isAddedLiked;
    final bookModel = detailModel.bookModel;

    final authors = bookModel.authors;
    final authorIsLiked = bookModel.author;
    final isAuthors = authors?.isEmpty == true || authors == null;
    final authorRemote = isAuthors ? '-' : authors.first.name;

    final authorValue = isAddLiked ? authorIsLiked : authorRemote;

    final summaries = bookModel.summaries;
    final summaryIsLiked = bookModel.summary ?? '-';
    final isSummaries = summaries?.isEmpty == true || summaries == null;
    final summaryRemote = isSummaries ? '-' : summaries.first.decodeApiHtml();

    final summariesValue = isAddLiked ? summaryIsLiked : summaryRemote;

    return MvvmBuilder(
      key: const ValueKey('liked-page'),
      viewModel: DetailViewModel(
        repository: LikedRepository(databaseHelper: DatabaseHelper()),
        bookModel: bookModel,
      ),
      view: (context) {
        return Scaffold(
          backgroundColor: kWhite,
          appBar: AppBar(
            actions: [
              Builder(
                builder: (context) {
                  final isAddedLiked = context.select(
                    (DetailViewModel vm) => vm.isAddedLiked,
                  );
                  return IconButton(
                    icon: Icon(
                      isAddedLiked ? Icons.favorite : Icons.favorite_outline,
                    ),
                    onPressed: () async {
                      final showSnackBar = ScaffoldMessenger.of(context);
                      final viewModel = context.read<DetailViewModel>();

                      if (isAddedLiked) {
                        final message = await viewModel.removeLikedBook(
                          bookModel,
                        );
                        if (message != null) {
                          showSnackBar.showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        }
                      } else {
                        final book = bookModel.copyWith(author: authorValue);
                        final message = await viewModel.saveLikedBook(
                          bookModel,
                        );
                        if (message != null) {
                          showSnackBar.showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    bookModel.title ?? '-',
                    style: DesignSystemTextStyle.current.heading4.copyWith(
                      color: kMainPrimary,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    authorValue ?? '-',
                    style: DesignSystemTextStyle.current.body2Regular.copyWith(
                      color: kTypographyBlackLow,
                    ),
                  ),
                  SizedBox(height: 16.w),
                  Text(
                    S.current.labelSummaries,
                    style: DesignSystemTextStyle.current.body1Bold,
                  ),
                  SizedBox(height: 5.w),
                  Text(
                    summariesValue,
                    style: DesignSystemTextStyle.current.body1Regular,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
