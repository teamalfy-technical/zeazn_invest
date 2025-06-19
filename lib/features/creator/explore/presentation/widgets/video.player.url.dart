import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';
import 'package:video_player/video_player.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

/// Stateful widget to fetch and then display video content.
class ZVideoPlayerURL extends StatefulWidget {
  final String url;
  const ZVideoPlayerURL({super.key, required this.url});

  @override
  _ZVideoPlayerURLState createState() => _ZVideoPlayerURLState();
}

class _ZVideoPlayerURLState extends State<ZVideoPlayerURL> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  final Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  String _formatDuration(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(position.inMinutes.remainder(60));
    final seconds = twoDigits(position.inSeconds.remainder(60));
    // return '${twoDigits(position.inHours)}:$minutes:$seconds';
    return '$minutes:$seconds';
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
        ? Column(
          // alignment: Alignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(ZAppSize.s8),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // width: _controller.value.size.width,
                        // height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ).onPressed(onTap: _onTapVideo),
                  ),
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
              ),
            ),
            ZAppSize.s16.verticalSpace,
            Row(
              children: [
                Text(
                  _formatDuration(_currentPosition),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZAppColor.blackColor,
                    fontSize: ZAppSize.s10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor:
                          ZAppColor.blackColor, // progress bar color
                      inactiveTrackColor:
                          ZAppColor.hintTextColor, // background track color
                      thumbColor: ZAppColor.blackColor, // draggable thumb color
                      overlayColor: ZAppColor.primary.withAlpha(
                        32,
                      ), // ripple when dragging
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 7,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 14,
                      ),
                      trackHeight: 5,
                    ),
                    child: Slider(
                      value: _currentPosition.inSeconds.toDouble(),
                      thumbColor: ZAppColor.blackColor,
                      min: 0,
                      max: _controller.value.duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        setState(() {});
                        _controller.seekTo(Duration(seconds: value.toInt()));
                      },
                    ),
                  ),
                ),
                Text(
                  _formatDuration(_controller.value.duration),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZAppColor.blackColor,
                    fontSize: ZAppSize.s10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
