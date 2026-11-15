import 'package:chewie/chewie.dart';

sealed class LessonVideoState {
  const LessonVideoState();
}

class LessonVideoLoading extends LessonVideoState {
  const LessonVideoLoading();
}

class LessonVideoReady extends LessonVideoState {
  const LessonVideoReady(this.controller, this.aspectRatio);

  final ChewieController controller;
  final double aspectRatio;
}

class LessonVideoError extends LessonVideoState {
  const LessonVideoError(this.message);

  final String message;
}
