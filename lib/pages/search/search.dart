import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_app/components/component.dart';
import 'package:v_app/configs/config.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/pages/page.dart';
import 'package:v_app/providers/provider.dart';
import 'package:v_app/services/service.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  StateSearchPage createState() => StateSearchPage();
}

class StateSearchPage extends ConsumerState {
  final search = TextEditingController();

  List<SearchUserModel> users = [];

  @override
  Widget build(BuildContext context) {
    final usersPro = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Search"),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 3)),
        backgroundColor: whiteColor,
        color: appColor,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 40,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                    horizontal: appDefaultPadding,
                    vertical: appDefaultPadding / 4,
                  ),
                  decoration: BoxDecoration(
                    color: greyColor.shade100,
                    borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: appDefaultPadding / 2,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: greyColor,
                      ),
                      const SizedBox(width: appDefaultPadding / 2),
                      // const Text(
                      //   "Search someone here",
                      //   style: TextStyle(color: greyColor),
                      // ),
                      Expanded(
                        child: TextField(
                          controller: search,
                          onChanged: (value) async {
                            List<SearchUserModel> searchUsers =
                                await UserServices().searchUsers(value);
                            print("Search user: $searchUsers");
                            print("Search user: $value");
                            users.addAll(searchUsers);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            hintText: 'Search someone here',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(vertical: appDefaultPadding / 2),
              sliver: usersPro.map(
                data: (data) {
                  users = data.value;
                  return SliverList.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final search = users[index];
                      return SearchUserCard(
                        user: search.user,
                        follower: search.followers.length,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FriendProfilePage(userId: search.user.id),
                          ),
                        ),
                      );
                    },
                  );
                },
                error: (error) => SliverToBoxAdapter(
                  child: PostErrorCard(onTap: () => ref.refresh(usersProvider)),
                ),
                loading: (loading) => SliverList.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) =>
                      const SearchUserLoadingCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
