import 'package:ar/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ProgrammingVideoView extends StatefulWidget {
  const ProgrammingVideoView({super.key});

  @override
  State<ProgrammingVideoView> createState() => _ProgrammingVideoViewState();
}

class _ProgrammingVideoViewState extends State<ProgrammingVideoView> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/programming.mp4');
    _videoPlayerController.initialize().then((_) {
      _chewieController = ChewieController(
        fullScreenByDefault: false,
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: false,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        allowFullScreen: true,
        allowPlaybackSpeedChanging: true,
        showControls: true,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundDecoration(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Text(
                'Programming',
                style:
                    GoogleFonts.aBeeZee(fontSize: 45.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  child: _chewieController != null &&
                          _chewieController!
                              .videoPlayerController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _chewieController!
                              .videoPlayerController.value.aspectRatio,
                          child: Chewie(
                            controller: _chewieController!,
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
