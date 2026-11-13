import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'lesson_video_state.dart';

/// Owns the video controllers so the view stays stateless.
class LessonVideoCubit extends Cubit<LessonVideoState> {
  LessonVideoCubit(this._assetPath) : super(const LessonVideoLoading());

  final String _assetPath;
  VideoPlayerController? _video;
  ChewieController? _chewie;

  Future<void> load() async {
    try {
      final video = VideoPlayerController.asset(_assetPath);
      _video = video;
      await video.initialize();
      _chewie = ChewieController(
        videoPlayerController: video,
        autoPlay: true,
        aspectRatio: video.value.aspectRatio,
        allowPlaybackSpeedChanging: true,
      );
      if (!isClosed) {
        emit(LessonVideoReady(_chewie!, video.value.aspectRatio));
      }
    } catch (e) {
      if (!isClosed) emit(const LessonVideoError('Could not load the video'));
    }
  }

  @override
  Future<void> close() {
    _chewie?.dispose();
    _video?.dispose();
    return super.close();
  }
}
