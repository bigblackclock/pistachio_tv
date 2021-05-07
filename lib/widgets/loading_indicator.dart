import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
            height: 40.0.w,
            width: 40.0.w,
            child: const CircularProgressIndicator()),
      );
}
