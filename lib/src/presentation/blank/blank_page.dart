import 'package:book_catalogue/generated/l10n.dart';
import 'package:book_catalogue/src/utils/themes/design_system_color.dart';
import 'package:flutter/material.dart';

import '../../utils/themes/design_system_text_style.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: kBlack,
        alignment: Alignment.center,
        child: Text(
          S.current.labelPageNotFound,
          style: DesignSystemTextStyle.current.heading4,
        ),
      ),
    );
  }
}
