import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/configs/config.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/providers/post_provider.dart';
import '../../components/component.dart';

class ExplorerPage extends ConsumerStatefulWidget {
  const ExplorerPage({super.key});

  @override
  StateExplorerPage createState() => StateExplorerPage();
}

class StateExplorerPage extends ConsumerState
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final postsData = ref.watch(postsProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(
          const Duration(seconds: 3),
          () => ref.refresh(postsProvider),
        ),
        backgroundColor: whiteColor,
        color: appColor,
        child: postsData.map(
          data: (data) {
            List<PostModel> posts = data.value;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) => PostCard(post: posts[index]),
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
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
