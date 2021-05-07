import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pistachio_tv/widgets/video/src/cubit/video_cubit.dart';
import 'package:pistachio_tv/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import 'cubit/cubit.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key, this.url}) : super(key: key);
  final String? url;

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoCubit? videoCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(builder: (context, state) {
      if (state.isInitialzed) {
        var height = state.isFullScreen
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height / 2;
        var width = state.isFullScreen
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2;
        return MouseRegion(
          onHover: (_) =>
              context.read<VideoCubit>().cancelAndRestartTimerControls(),
          child: Container(
            height: height,
            width: width,
            child: AspectRatio(
              aspectRatio:
                  context.read<VideoCubit>().controller!.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(context.read<VideoCubit>().controller!),
                  state.isControlsVisable
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.grey.shade300,
                            width: width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Live'),
                                  IconButton(
                                      icon: Icon(state.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                      onPressed: () => context
                                          .read<VideoCubit>()
                                          .playPause()),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(state.isFullScreen
                                        ? Icons.fullscreen_exit
                                        : Icons.fullscreen),
                                    onPressed: () =>
                                        context.read<VideoCubit>().fullScreen(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      } else if (state.isError) {
        return const LoadingErrorWidget();
      } else if (state.firstState)
        return const Icon(Icons.tv);
      else
        return const LoadingIndicator();
    });
  }
}
