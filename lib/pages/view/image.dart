import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_app/configs/app_config.dart';

class ViewImagePage extends StatefulWidget {
  const ViewImagePage({super.key});

  @override
  State<ViewImagePage> createState() => _ViewImagePageState();
}

class _ViewImagePageState extends State<ViewImagePage> {
  int _currentIndex = 1;
  bool _visible = true;
  final PageController _pageController = PageController();

  List<String> images = [
    "https://i.pinimg.com/736x/ad/0e/89/ad0e89cfcf632f0cb8006cf25e4b06b9.jpg",
    "https://i.pinimg.com/736x/eb/95/a3/eb95a35fe0ec07e6efa4ff5f3152b059.jpg",
    "https://i.pinimg.com/736x/a7/5a/a8/a75aa80a98d01d4a92204ca9f2144a5b.jpg",
    "https://i.pinimg.com/564x/e7/96/dd/e796dda6213ee06d9e58b334d21394b0.jpg",
  ];

  showDetail() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Stack(
        children: [
          Dismissible(
            key: const Key('dismiss_image_view'),
            direction: DismissDirection.vertical,
            onDismissed: (DismissDirection direction) => Navigator.pop(context),
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: images.length,
              controller: _pageController,
              itemBuilder: (context, index) => InkWell(
                onTap: () => showDetail(),
                onLongPress: () => showMoreAction(context),
                child: Center(
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
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
                                  const SizedBox(width: appDefaultPadding / 2),
                                  const Text(
                                    "20.12k",
                                    style: TextStyle(color: whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
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
                                  const SizedBox(width: appDefaultPadding / 2),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
