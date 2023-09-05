import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/databases/database.dart';
import 'package:v_app/pages/page.dart';
import 'package:v_app/pages/setting/setting.dart';
import 'package:v_app/providers/provider.dart';

import '../../components/component.dart';
import '../../models/model.dart';

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key});

  @override
  StateMyProfilePage createState() => StateMyProfilePage();
}

class StateMyProfilePage extends ConsumerState with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  Future<void> getUserData() async {
    try {
      final res = await UserDatabase().getUser();
      if (res != null) {
        print('User : $res');
      } else {
        print('User data is not available.');
      }
    } catch (e) {
      print('Error getting user data from local storage: $e');
      // Optionally, rethrow the exception if needed
      // throw Exception('Error getting user data from local storage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserData();

    final userData = ref.watch(userProvider(userId));
    final postsData = ref.watch(userPostsProvider(userId));
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
        onRefresh: () => Future.delayed(const Duration(seconds: 3), () {
          ref.watch(userPostsProvider(userId));
        }),
        backgroundColor: whiteColor,
        color: appColor,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: userData.map(
                data: (data) {
                  final user = data.value;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(appDefaultPadding),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                user.user.profileImage,
                              ),
                            ),
                            const SizedBox(width: appDefaultPadding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user.user.name} ${user.user.lastName}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "@${user.user.name}${user.user.lastName}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: greyColor,
                                  ),
                                ),
                                const SizedBox(height: appDefaultPadding / 2),
                                const Text(
                                  "Vientaine Capital, Laos",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(appDefaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${user.count.followingCount}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: appDefaultPadding / 4),
                                const Text(
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
                                  "${user.count.repliesCount}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: appDefaultPadding / 4),
                                const Text(
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
                                  "${user.count.likesCount}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: appDefaultPadding / 4),
                                const Text(
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
                                  "${user.count.sharesCount}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: appDefaultPadding / 4),
                                const Text(
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
                  );
                },
                error: (error) => PostErrorCard(onTap: () {}),
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
            children: [
              postsData.map(
                data: (data) {
                  List<PostModel> posts = data.value;
                  if (posts.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.data_exploration,
                          size: 50,
                          color: greyColor.shade400,
                        ),
                        const SizedBox(height: appDefaultPadding),
                        const Text("You don't have any post"),
                      ],
                    );
                  }
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) =>
                        PostCard(post: posts[index]),
                  );
                },
                error: (error) => PostErrorCard(
                  onTap: () => ref.refresh(postsProvider),
                ),
                loading: (loading) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) => const PostLoadingCard(),
                ),
              ),
              const ExplorerPage(),
              const ExplorerPage(),
              const ExplorerPage(),
            ],
          ),
        ),
      ),
    );
  }
}
