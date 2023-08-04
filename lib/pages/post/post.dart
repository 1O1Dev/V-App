import 'package:flutter/material.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/models/post_mode.dart';
import 'package:v_app/pages/page.dart';
import 'package:v_app/services/service.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final postTitle = TextEditingController();
  bool emptyTitle = false;

  void onPost() async {
    final post = CreatePostModel(
      userId: "64aa8109a76d0e3516fd3334",
      title: postTitle.text,
      files: [
        CreateFileModel(
          fileType: 'image',
          fileUri:
              'https://i.pinimg.com/736x/e5/7b/64/e57b64e4f82ca683bb71c7cb385940fa.jpg',
        ),
        CreateFileModel(
          fileType: 'image',
          fileUri:
              'https://i.pinimg.com/736x/e5/7b/64/e57b64e4f82ca683bb71c7cb385940fa.jpg',
        ),
        CreateFileModel(
          fileType: 'image',
          fileUri:
              'https://i.pinimg.com/736x/e5/7b/64/e57b64e4f82ca683bb71c7cb385940fa.jpg',
        ),
      ],
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: appColor.shade100,
                    color: appColor,
                  ),
                  const SizedBox(height: appDefaultPadding),
                  const Text(
                    "Posting",
                    style: TextStyle(
                      color: appColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    bool isPost = await PostServices().createPost(post);
    if (!isPost) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: const EdgeInsets.all(appDefaultPadding),
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
            ),
            child: const Text(
              "Can't post",
              style: TextStyle(
                fontSize: 18,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
      Navigator.pop(context);
    }
    if (isPost)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppPage(),
        ),
      );
  }

  void checkInput() {
    postTitle.addListener(() {
      if (postTitle.text.isNotEmpty) {
        setState(() {
          emptyTitle = true;
        });
      } else {
        setState(() {
          emptyTitle = false;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    checkInput();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: 1,
            curve: Curves.bounceInOut,
            child: Visibility(
              visible: emptyTitle,
              child: Container(
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
                  onTap: () => onPost(),
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding),
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
