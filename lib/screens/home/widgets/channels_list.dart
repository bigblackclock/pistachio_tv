import 'package:flutter/material.dart';
import 'package:pistachio_tv/models/models.dart';
import 'package:pistachio_tv/theme/theme.dart';
import 'package:pistachio_tv/widgets/video/src/cubit/cubit.dart';
import 'package:pistachio_tv/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ChannelsList extends StatefulWidget {
  const ChannelsList({Key? key}) : super(key: key);

  @override
  _ChannelsListState createState() => _ChannelsListState();
}

class _ChannelsListState extends State<ChannelsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Channel().getAllChannels(),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Channel> channles = snapshot.data;

          return Scrollbar(
            //   controller: _scrollController,
            showTrackOnHover: true, // default false
            isAlwaysShown: true, // default false
            // scrollbarFadeDuration: Duration(
            //     milliseconds: 500), // default : Duration(milliseconds: 300)
            // scrollbarTimeToFade: Duration(
            //     milliseconds: 800), // default : Duration(milliseconds: 600)
            // style: VsScrollbarStyle(
            //   hoverThickness: 10.0, // default 12.0
            //   radius: Radius.circular(10), // default Radius.circular(8.0)
            //   thickness: 10.0, // [ default 8.0 ]
            //   color: Colors.purple.shade900, // default ColorScheme Theme
            // ),
            child: ListView.builder(
              //  controller: _scrollController,
              itemBuilder: (context, index) => ListTile(
                onTap: () => context
                    .read<VideoCubit>()
                    .init(channles[index].channelUrls![0].url!),
                title: Text(
                  channles[index].title,
                  style: const TextStyle(color: Colors.white),
                ),
                leading: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CachedImageWidget(
                    imgUrl:
                        'https://api.codetabs.com/v1/proxy/?quest=${channles[index].logo}',
                  ),
                ),
                trailing: Text(
                  index.toString(),
                  style: const TextStyle(color: AppTheme.yellow),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              ),
              itemCount: channles.length,
            ),
          );
        } else if (snapshot.hasError)
          return const LoadingErrorWidget();
        else
          return const LoadingIndicator();
      },
    );
  }
}
