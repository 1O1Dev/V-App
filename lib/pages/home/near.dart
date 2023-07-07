import 'package:flutter/material.dart';
import '../../components/component.dart';
import '../../configs/config.dart';

class NearYouPage extends StatefulWidget {
  const NearYouPage({super.key});

  @override
  State<NearYouPage> createState() => _NearYouPageState();
}

class _NearYouPageState extends State<NearYouPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 3)),
        backgroundColor: whiteColor,
        color: appColor,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) => const PostCard(),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
