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

  videoPlayer() {
    if (widget.file.fileType == "video") {
      _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.file.fileUri),
      );
      _videoController!.setLooping(false);
      _videoController!.play();
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
              if (widget.file.fileType == "image") {
                return const ViewImagePage();
              } else {
                return ViewVideoPage(videoUri: widget.file.fileUri);
              }
            },
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(appDefaultBorderRadius),
          child: widget.file.fileType == 'image'
              ? Image.network(
                  widget.file.fileUri,
                  fit: BoxFit.cover,
                )
              : VideoPlayer(_videoController!),
        ),
      ),
    );
  }
}
