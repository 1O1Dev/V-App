import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/configs/api_config.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/models/message.dart';
import 'package:v_app/providers/provider.dart';
import 'package:v_app/services/message.dart';

class MessagePage extends ConsumerStatefulWidget {
  const MessagePage({super.key});

  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends ConsumerState<MessagePage> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final messagePro = ref.watch(messageProvider);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 45,
        titleSpacing: 2,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          splashRadius: 18,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: blackColor,
            size: 20,
          ),
        ),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/5a/ef/3c/5aef3c0f37e971ff8ff286fd58396071.jpg',
              ),
            ),
            SizedBox(width: appDefaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chansy",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Online 3h ago",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 18,
            icon: const CircleAvatar(
              backgroundColor: appColor,
              child: Icon(
                Icons.call,
                size: 16,
                color: whiteColor,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            splashRadius: 18,
            icon: const CircleAvatar(
              backgroundColor: appColor,
              child: Icon(
                Icons.video_call_rounded,
                size: 20,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: messagePro.map(
              data: (data) {
                List<Message> messagesList = data.value;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: messagesList.length,
                  reverse: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: appDefaultPadding,
                    vertical: appDefaultPadding / 2,
                  ),
                  itemBuilder: (context, index) {
                    final message = messagesList[index];
                    // Receiver message
                    if (message.receiver == receiverId) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: appDefaultPadding / 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/736x/b2/96/3b/b2963b8409faf5db6a20a5b2d1246125.jpg',
                                  ),
                                ),
                                SizedBox(width: appDefaultPadding / 2),
                                Text(
                                  '2h ago',
                                  style: TextStyle(
                                    color: greyColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: appDefaultPadding / 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: appDefaultPadding,
                                  vertical: appDefaultPadding / 2,
                                ),
                                decoration: BoxDecoration(
                                  color: greyColor.shade100,
                                  borderRadius: BorderRadius.circular(
                                    appDefaultBorderRadius,
                                  ),
                                ),
                                child: Text(message.message),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    // Sender message
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: appDefaultPadding / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '2h ago',
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: appDefaultPadding / 2),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  'https://i.pinimg.com/736x/2a/36/49/2a364917ff03ddc41e38285ed0326225.jpg',
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: appDefaultPadding / 2,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: appDefaultPadding,
                                vertical: appDefaultPadding / 2,
                              ),
                              decoration: BoxDecoration(
                                color: appColor,
                                borderRadius: BorderRadius.circular(
                                  appDefaultBorderRadius,
                                ),
                              ),
                              child: Text(
                                message.message,
                                style: const TextStyle(color: whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              error: (error) => const Center(
                child: Text("Failed to get message"),
              ),
              loading: (loading) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              height: 45,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    splashRadius: 18,
                    icon: const Icon(
                      Icons.grid_view_rounded,
                      size: 18,
                      color: appColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 18,
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 18,
                      color: appColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 18,
                    icon: const Icon(
                      Icons.photo_camera_back_rounded,
                      size: 18,
                      color: appColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (messageController.text.isNotEmpty) {
                        MessageService().sendMessage(messageController.text);
                      }
                    },
                    splashRadius: 18,
                    icon: const Icon(
                      Icons.mic_rounded,
                      size: 18,
                      color: appColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: appDefaultPadding / 2.2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding,
                      ),
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius: BorderRadius.circular(
                          appDefaultBorderRadius * 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Message',
                          hintStyle: TextStyle(color: greyColor, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: appDefaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
