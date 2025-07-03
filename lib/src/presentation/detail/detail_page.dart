import 'package:book_catalogue/src/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../domain/entities/book_model.dart';
import '../../utils/themes/design_system_color.dart';
import '../../utils/themes/design_system_text_style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final authors = bookModel.authors;
    final isAuthors = authors?.isEmpty == true || authors == null;
    final authorValue = isAuthors ? '-' : authors.first.name;

    final summaries = bookModel.summaries;
    final isSummaries = summaries?.isEmpty == true || summaries == null;
    final summariesValue = isSummaries ? '-' : summaries.first.decodeApiHtml();

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(),
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
  }
}
