import 'package:flutter/material.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/pages/page.dart';
import 'package:video_player/video_player.dart';
import '../../configs/config.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    Key? key,
    required this.file,
  }) : super(key: key);
  final FileModel file;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  VideoPlayerController? _videoController;
  bool _isPlaying = false;

  videoPlayer() {
    if (widget.file.fileType == "video") {
      _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.file.fileUri),
      );
      _videoController!.addListener(() {
        setState(() {});
      });
      _videoController!.setLooping(false);
      _videoController!.initialize().then((_) => setState(() {}));
      _videoController!.pause();
    }
  }

  onTappedPlay() {
    if (_isPlaying == false) {
      setState(() {
        _videoController!.play();
        _isPlaying = true;
      });
    } else {
      setState(() {
        _videoController!.pause();
        _isPlaying = false;
      });
    }
  }

  @override
  void initState() {
    videoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.file.fileType == "video") {
      _videoController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      margin: const EdgeInsets.only(right: appDefaultPadding / 2),
      decoration: BoxDecoration(
        color: greyColor.shade100,
        borderRadius: BorderRadius.circular(appDefaultBorderRadius),
        border: Border.all(color: greyColor.shade200),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (widget.file.fileType == "video") {
                return AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: ViewVideoPage(videoUri: widget.file.fileUri),
                );
              } else {
                return const ViewImagePage();
              }
            },
          ),
        ),
        borderRadius: BorderRadius.circular(appDefaultBorderRadius),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(appDefaultBorderRadius),
          child: widget.file.fileType == 'video'
              ? Stack(
                  children: [
                    VideoPlayer(_videoController!),
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
                  ],
                )
              : Image.network(
                  widget.file.fileUri,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
