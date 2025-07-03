import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../data/persistance/database_helper.dart';
import '../../data/repositories/liked_repository.dart';
import '../../utils/mvvm/components/mvvm_builder.dart';
import '../../utils/themes/design_system_text_style.dart';
import '../blank/blank_page.dart';
import '../books/book_page.dart';
import 'view_model/liked_view_model.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
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
      key: const ValueKey('liked-page'),
      viewModel: LikedViewModel(
        repository: LikedRepository(databaseHelper: DatabaseHelper()),
      ),
      view: (context) {
        final likedModel = context.select(
          (LikedViewModel vm) => vm.listLikedBookModel,
        );

        return likedModel?.isEmpty == true
            ? Center(
                child: Text(
                  S.current.labelEmptyLiked,
                  style: DesignSystemTextStyle.current.heading4,
                ),
              )
            : ListView.separated(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.w),
                itemCount: likedModel?.length ?? 0,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final bookItem = likedModel?[index];

                  if (bookItem == null || likedModel?.isEmpty == true) {
                    return const BlankPage();
                  }

                  return BookItem(bookModel: bookItem, isLiked: true);
                },
              );
      },
    );
  }
}
