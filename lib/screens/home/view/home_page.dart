import 'package:flutter/material.dart';
import 'package:pistachio_tv/screens/home/widgets/channels_list.dart';
import 'package:pistachio_tv/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 150.w,
            child: const ChannelsList(),
          ),
          const Expanded(child: VideoWidget())
        ],
      ),
    );
  }
}
