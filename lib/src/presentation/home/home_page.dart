import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../utils/themes/design_system_color.dart';
import '../../utils/themes/design_system_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text(
          S.current.title,
          style: DesignSystemTextStyle.current.heading4,
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: S.current.labelBooks),
            Tab(text: S.current.labelLiked),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Text('Tab 1', style: DesignSystemTextStyle.current.heading4),
          ),
          Center(
            child: Text('Tab 2', style: DesignSystemTextStyle.current.heading4),
          ),
        ],
      ),
    );
  }
}
