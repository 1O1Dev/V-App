import 'package:flutter/material.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/pages/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        flexibleSpace: FlexibleSpaceBar(
          background: SafeArea(
            child: TabBar(
              controller: _tabController,
              automaticIndicatorColorAdjustment: true,
              isScrollable: true,
              splashBorderRadius: BorderRadius.circular(
                appDefaultBorderRadius * 2,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: appDefaultPadding,
                vertical: appDefaultPadding / 2,
              ),
              tabs: const [
                Tab(text: 'Explorer'),
                Tab(text: 'Near You'),
                Tab(text: 'Following'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ExplorerPage(),
          FollowingPage(),
          NearYourPage(),
        ],
      ),
    );
  }
}
