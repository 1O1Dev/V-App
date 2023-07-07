import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/pages/page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final Widget postIcon = SvgPicture.asset('assets/icons/post.svg');

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
        title: const Text('Notification'),
        actions: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(
              appDefaultBorderRadius * 2,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: appDefaultPadding,
              vertical: appDefaultPadding / 2,
            ),
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Verified'),
              Tab(text: 'Mention'),
            ],
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: const [
          ExplorerPage(),
          NearYouPage(),
          FollowingPage(),
        ],
      ),
    );
  }
}
