import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/pages/page.dart';
import 'package:v_app/providers/provider.dart';

import '../../components/component.dart';

class FriendProfilePage extends StatefulWidget {
  final String userId;
  const FriendProfilePage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  @override
  State<FriendProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<FriendProfilePage>
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          splashRadius: 18,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: blackColor,
            size: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appDefaultPadding,
              vertical: appDefaultPadding / 2,
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: appDefaultPadding),
                decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Follow",
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final userId = widget.userId;
          final userPro = ref.watch(userProvider(userId));
          return RefreshIndicator(
            onRefresh: () => Future.delayed(const Duration(seconds: 3)),
            backgroundColor: whiteColor,
            color: appColor,
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: userPro.map(
                    data: (data) {
                      final user = data.value;
                      return UserProfile(user: user);
                    },
                    error: (error) => PostErrorCard(
                      onTap: () => ref.refresh(userProvider(userId)),
                    ),
                    loading: (loading) => const ProfileLoading(),
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
          );
        },
      ),
    );
  }
}
