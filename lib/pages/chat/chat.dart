import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../configs/config.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        toolbarHeight: 45,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: SizedBox(
            height: 40,
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(
                horizontal: appDefaultPadding,
                vertical: appDefaultPadding / 4,
              ),
              decoration: BoxDecoration(
                color: greyColor.shade100,
                borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: appDefaultPadding / 2),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: greyColor,
                  ),
                  const SizedBox(width: appDefaultPadding / 2),
                  const Text(
                    "Search your friends here",
                    style: TextStyle(color: greyColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: appDefaultPadding / 2),
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          highlightColor: greyColor.shade100,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: appDefaultPadding,
              vertical: appDefaultPadding / 2,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(),
                SizedBox(width: appDefaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Someone",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: appDefaultPadding / 4),
                      Text(
                        "Hello",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: greyColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  '11:24 AM',
                  style: TextStyle(fontSize: 12, color: greyColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
