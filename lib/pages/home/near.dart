import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/component.dart';
import '../../configs/config.dart';
import '../../models/model.dart';
import '../../providers/post_provider.dart';

class NearYouPage extends ConsumerStatefulWidget {
  const NearYouPage({super.key});

  @override
  StateNearYouPage createState() => StateNearYouPage();
}

class StateNearYouPage extends ConsumerState
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final postsData = ref.watch(postsProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 3)),
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
          error: (error) => const Center(
            child: Text("Failed to load post"),
          ),
          loading: (loading) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
