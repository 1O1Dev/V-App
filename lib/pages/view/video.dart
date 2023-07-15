// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import 'package:v_app/configs/app_config.dart';

class ViewVideoPage extends StatefulWidget {
  final String videoUri;
  const ViewVideoPage({
    Key? key,
    required this.videoUri,
  }) : super(key: key);
  @override
  State<ViewVideoPage> createState() => _ViewVideoPageState();
}

class _ViewVideoPageState extends State<ViewVideoPage> {
  int _currentIndex = 1;
  bool _visible = true;
  bool _isPlaying = true;
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;

  showDetail() {
    setState(() {
      _visible = !_visible;
    });
  }

  videoPlayer() {
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUri));

    _videoController!.addListener(() {
      setState(() {});
    });
    _videoController!.setLooping(false);
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

  onTappedPlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (_isPlaying == true) {
      setState(() {
        _videoController!.play();
      });
    } else {
      setState(() {
        _videoController!.pause();
      });
    }
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
            child: Center(
              child: AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                    Center(
                      child: InkWell(
                        onTap: onTappedPlay,
                        borderRadius: BorderRadius.circular(
                          appDefaultBorderRadius * 2,
                        ),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(
                              appDefaultBorderRadius * 2,
                            ),
                          ),
                          child: Icon(_isPlaying == true
                              ? Icons.pause
                              : Icons.play_arrow_rounded),
                        ),
                      ),
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
                                        height: 18,
                                        width: 18,
                                        child: SvgPicture.asset(
                                          'assets/icons/like.svg',
                                          color: whiteColor,
                                        ),
                                      ),
                                      const SizedBox(
                                          width: appDefaultPadding / 2),
                                      const Text(
                                        "20.12k",
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 12,
                                        ),
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
                                        height: 18,
                                        width: 18,
                                        child: SvgPicture.asset(
                                          'assets/icons/comment.svg',
                                          color: whiteColor,
                                        ),
                                      ),
                                      const SizedBox(
                                          width: appDefaultPadding / 2),
                                      const Text(
                                        "1.51k",
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 12,
                                        ),
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
                                          height: 18,
                                          width: 18,
                                          child: SvgPicture.asset(
                                            'assets/icons/repost.svg',
                                            color: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: appDefaultPadding / 2),
                                        const Text(
                                          "2.23k",
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 12,
                                          ),
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
                                          height: 18,
                                          width: 18,
                                          child: SvgPicture.asset(
                                            'assets/icons/share.svg',
                                            color: whiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: appDefaultPadding / 2),
                                        const Text(
                                          "5.95",
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 12,
                                          ),
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
