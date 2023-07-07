import 'package:flutter/material.dart';
import 'package:v_app/configs/app_config.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final postTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          splashRadius: 18,
          icon: const Icon(
            Icons.close,
            color: blackColor,
          ),
        ),
        title: const Text('New Post'),
        actions: [
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(
              vertical: appDefaultPadding / 2,
              horizontal: appDefaultPadding,
            ),
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: appDefaultPadding),
                alignment: Alignment.center,
                child: const Text(
                  'Post',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(appDefaultPadding),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/5a/ef/3c/5aef3c0f37e971ff8ff286fd58396071.jpg',
                  ),
                ),
                const SizedBox(width: appDefaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: appDefaultPadding / 4),
                      const Text(
                        "Chansy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: postTitle,
                        minLines: 1,
                        maxLines: 150,
                        decoration: const InputDecoration(
                          hintText: "What's your post",
                          isDense: true,
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle: TextStyle(fontSize: 14, color: greyColor),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: appDefaultPadding / 2),
                      Container(
                        padding: const EdgeInsets.all(appDefaultPadding / 2),
                        decoration: BoxDecoration(
                          color: greyColor.shade100,
                          borderRadius:
                              BorderRadius.circular(appDefaultBorderRadius),
                        ),
                        child: const Icon(
                          Icons.file_present_outlined,
                          size: 20,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: appDefaultPadding),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4),
                  child: const Row(
                    children: [
                      Icon(Icons.tag, size: 20),
                      SizedBox(width: appDefaultPadding / 2),
                      Text("Tag someone"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
