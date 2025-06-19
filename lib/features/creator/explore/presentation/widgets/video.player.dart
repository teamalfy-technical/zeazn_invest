import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:video_player/video_player.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

/// Stateful widget to fetch and then display video content.
class ZVideoPlayer extends StatefulWidget {
  final File file;

  const ZVideoPlayer({super.key, required this.file});

  @override
  _ZVideoPlayerState createState() => _ZVideoPlayerState();
}

class _ZVideoPlayerState extends State<ZVideoPlayer> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  final Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _showControls = false; // hide controls when video starts playing
      }
    });
  }

  void _onTapVideo() {
    setState(() {
      _showControls = !_showControls; // toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
          // alignment: Alignment.center,
          children: [
            SizedBox(
              height: ZAppSize.s200,
              width: ZDeviceUtil.getDeviceWidth(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ZAppSize.s8),
                child: FittedBox(
                  fit: BoxFit.cover, // or BoxFit.contain if you prefer
                  clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ).onPressed(onTap: _onTapVideo),

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 16,
              child: AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Transform.scale(
                  scale: 0.5,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: _togglePlayPause,
                    icon:
                        (_controller.value.isPlaying)
                            ? Assets.icons.pauseIcon.svg()
                            : Assets.icons.playIcon.svg(),
                  ),
                ),
              ),
            ),
          ],
        ).only(bottom: ZAppSize.s24)
        : Container(
          width: ZDeviceUtil.getDeviceWidth(context),
          height: ZAppSize.s200,
          decoration: BoxDecoration(
            color: ZAppColor.whiteColor,
            borderRadius: BorderRadius.circular(ZAppSize.s10),
          ),
          child: Transform.scale(
            scale: 0.5,
            child: Assets.icons.playIcon.svg(),
          ),
        ).redacted(context: context, redact: _controller.value.isInitialized);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
