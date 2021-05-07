part of 'video_cubit.dart';

class VideoState extends Equatable {
  const VideoState({
    this.isInitialzed = false,
    this.isControlsVisable = false,
    this.isLoading = true,
    this.isError = false,
    this.isFullScreen = false,
    this.isPlaying = false,
    this.firstState = true,
  });
  final bool firstState;
  final bool isInitialzed;
  final bool isControlsVisable;
  final bool isFullScreen;
  final bool isPlaying;
  final bool isLoading;
  final bool isError;

  @override
  List<Object> get props => [
        isInitialzed,
        isControlsVisable,
        isLoading,
        isError,
        isFullScreen,
        isPlaying,
        firstState,
      ];

  VideoState copyWith({
    bool? isInitialzed,
    bool? isControlsVisable,
    bool? isLoading,
    bool? isError,
    bool? isPlaying,
    bool? isFullScreen,
    bool? firstState,
  }) {
    return VideoState(
      isInitialzed: isInitialzed ?? this.isInitialzed,
      isControlsVisable: isControlsVisable ?? this.isControlsVisable,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      isPlaying: isPlaying ?? this.isPlaying,
      isFullScreen: isFullScreen ?? this.isFullScreen,
      firstState: firstState ?? this.firstState,
    );
  }
}
