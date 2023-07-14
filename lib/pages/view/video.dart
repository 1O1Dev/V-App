import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:v_app/configs/app_config.dart';

class ViewVideoPage extends StatefulWidget {
  const ViewVideoPage({super.key});

  @override
  State<ViewVideoPage> createState() => _ViewVideoPageState();
}

class _ViewVideoPageState extends State<ViewVideoPage> {
  int _currentIndex = 1;
  bool _visible = true;
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;

  List<String> images = [
    "https://v1.pinimg.com/videos/mc/expMp4/c1/7e/e2/c17ee2b8b9b42b13067f43c5d2b6dbe3_t1.mp4",
    "https://v1.pinimg.com/videos/mc/720p/cc/62/df/cc62df8e1f1349725bbe38d11e5258be.mp4",
    "https://v1.pinimg.com/videos/mc/expMp4/87/dc/2b/87dc2b86aace3d7fd6be90f572b37ee6_t1.mp4",
  ];

  showDetail() {
    setState(() {
      _visible = !_visible;
    });
  }

  videoPlayer() {
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://v1.pinimg.com/videos/mc/expMp4/c1/7e/e2/c17ee2b8b9b42b13067f43c5d2b6dbe3_t1.mp4',
      ),
    );

    _videoController!.addListener(() {
      if (_videoController!.play() == true) {
        print("Playing");
      }
      setState(() {});
    });
    _videoController!.setLooping(true);
    _videoController!.initialize().then((_) => setState(() {}));
    _videoController!.play();
  }

  pageViewer() {
    _pageController.addListener(() {
      final currentPage = _pageController.page;
      final newCurrentIndex = currentPage!.round();

      if (currentPage > _currentIndex) {
        setState(() {
          _currentIndex = newCurrentIndex;
        });
      } else if (currentPage < _currentIndex) {
        if (newCurrentIndex != 0) {
          setState(() {
            _currentIndex = newCurrentIndex;
          });
        }
      }
    });
  }

  @override
  void initState() {
    pageViewer();
    videoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    // _videoController!.pause();
    _videoController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Stack(
        children: [
          Dismissible(
            key: const Key('dismiss_image_view'),
            direction: DismissDirection.vertical,
            onDismissed: (DismissDirection direction) {
              _videoController!.dispose();
              Navigator.pop(context);
            },
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: images.length,
              controller: _pageController,
              itemBuilder: (context, index) => InkWell(
                onTap: () => showDetail(),
                onLongPress: () => showMoreAction(context),
                child: AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 100),
            child: Visibility(
              visible: _visible,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: appDefaultPadding),
                            Container(
                              height: 20,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(
                                  appDefaultBorderRadius,
                                ),
                              ),
                              child: Text(
                                "${images.length}/$_currentIndex",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => showMoreAction(context),
                          splashRadius: 18,
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        VideoProgressIndicator(
                          _videoController!,
                          allowScrubbing: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: appDefaultPadding,
                          ),
                          colors: VideoProgressColors(
                            backgroundColor: whiteColor.withOpacity(0.4),
                            playedColor: appColor,
                          ),
                        ),
                        const SizedBox(height: appDefaultPadding),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: appDefaultPadding,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  _videoController!.pause();
                                },
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: appDefaultPadding,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          'assets/icons/like.svg',
                                          color: whiteColor,
                                        ),
                                      ),
                                      const SizedBox(
                                          width: appDefaultPadding / 2),
                                      const Text(
                                        "20.12k",
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _videoController!.play();
                                },
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: appDefaultPadding,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          'assets/icons/comment.svg',
                                          color: whiteColor,
                                        ),
                                      ),
                                      const SizedBox(
                                          width: appDefaultPadding / 2),
                                      const Text(
                                        "1.51k",
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: appDefaultPadding,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: SvgPicture.asset(
                                            'assets/icons/repost.svg',
                                            color: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: appDefaultPadding / 2),
                                        const Text(
                                          "2.23k",
                                          style: TextStyle(color: whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: appDefaultPadding,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: SvgPicture.asset(
                                            'assets/icons/share.svg',
                                            color: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: appDefaultPadding / 2),
                                        const Text(
                                          "5.95",
                                          style: TextStyle(color: whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showMoreAction(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: blackColor.withOpacity(0.4),
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 140,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(appDefaultBorderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: appDefaultPadding),
        child: Column(
          children: [
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: greyColor.shade300,
                borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              ),
              margin: const EdgeInsets.all(appDefaultPadding / 2),
            ),
            const SizedBox(height: appDefaultPadding / 2),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: greyColor.shade100,
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                ),
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: appDefaultPadding),
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.download, size: 16),
                    SizedBox(width: appDefaultPadding),
                    Text(
                      'Save to phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: appDefaultPadding),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: greyColor.shade100,
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                ),
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: appDefaultPadding),
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.bug, size: 16, color: redColor),
                    SizedBox(width: appDefaultPadding),
                    Text(
                      'Report photo',
                      style: TextStyle(color: redColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
