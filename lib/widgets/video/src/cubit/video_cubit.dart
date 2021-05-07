import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pistachio_tv/utils/web/web_utils.dart';
import 'package:video_player/video_player.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(const VideoState());
  VideoPlayerController? controller;
  Timer? _hideTimer;
  Future<void> init(String url) async {
    emit(state.copyWith(isInitialzed: false, firstState: false));
    await Future.delayed(const Duration(milliseconds: 10));

    if (controller != null) {
      await controller?.pause();
      await controller?.dispose();
    }
    controller = VideoPlayerController.network(url);
    await controller?.initialize();
    emit(state.copyWith(
      isInitialzed: true,
      isLoading: false,
    ));
    await controller?.play();
    emit(state.copyWith(isPlaying: true));
  }

  void printo() {
    print('asd');
  }

  void cancelAndRestartTimerControls() {
    _hideTimer?.cancel();
    _startHideTimer();

    emit(state.copyWith(isControlsVisable: true));
  }

  void fullScreen() {
    if (state.isFullScreen) {
      WebUtils.exitFullscreen();
      emit(state.copyWith(isFullScreen: false));
    } else {
      WebUtils.requestFullscreen();
      emit(state.copyWith(isFullScreen: true));
    }
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      emit(state.copyWith(isControlsVisable: false));
    });
  }

  void playPause() async {
    if (state.isPlaying) {
      await controller?.pause();
      emit(state.copyWith(isPlaying: false));
    } else {
      await controller?.play();
      emit(state.copyWith(isPlaying: true));
    }
  }
}
