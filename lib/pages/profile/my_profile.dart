import 'package:flutter/material.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/pages/page.dart';
import 'package:v_app/pages/setting/setting.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingPage(),
              ),
            ),
            splashRadius: 18,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 3)),
        backgroundColor: whiteColor,
        color: appColor,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(appDefaultPadding),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://i.pinimg.com/736x/e6/9d/9d/e69d9de044b99b6f641b24c41c393345.jpg',
                          ),
                        ),
                        SizedBox(width: appDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chansy Thor",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "@chansythor1999",
                              style: TextStyle(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                            SizedBox(height: appDefaultPadding / 2),
                            Text(
                              "Vientaine Capital, Laos",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(appDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "600",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: appDefaultPadding / 4),
                            Text(
                              "Following",
                              style: TextStyle(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "1.2K",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: appDefaultPadding / 4),
                            Text(
                              "Replies",
                              style: TextStyle(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "12.1K",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: appDefaultPadding / 4),
                            Text(
                              "Like",
                              style: TextStyle(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "2.8K",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: appDefaultPadding / 4),
                            Text(
                              "Share",
                              style: TextStyle(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverAppBar(
              pinned: true,
              toolbarHeight: 35,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: appColor,
                  labelColor: appColor,
                  indicator: const BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      bottom: BorderSide(
                        color: appColor,
                        width: 2,
                      ),
                    ),
                  ),
                  indicatorWeight: 5.0,
                  tabs: const [
                    Tab(text: 'Post'),
                    Tab(text: 'Replies'),
                    Tab(text: 'Like'),
                    Tab(text: 'Share'),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            physics: const BouncingScrollPhysics(),
            children: const [
              ExplorerPage(),
              ExplorerPage(),
              ExplorerPage(),
              ExplorerPage(),
            ],
          ),
        ),
      ),
    );
  }
}
