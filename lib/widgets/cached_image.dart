import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    Key? key,
    this.imgUrl = 'https://dashboard.back4app.com/apps/favicon.png',
    this.borderRadius,
  }) : super(key: key);
  final BorderRadius? borderRadius;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(imgUrl,
        shape: BoxShape.rectangle,
        borderRadius: borderRadius ?? BorderRadius.circular(10.0.r),
        loadStateChanged: (ExtendedImageState state) {
      switch (state.extendedImageLoadState) {
        case LoadState.loading:
          return Container(
            decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(10.0.r)),
          );

        case LoadState.completed:
          return ExtendedRawImage(
            fit: BoxFit.cover,
            image: state.extendedImageInfo?.image,
          );
        case LoadState.failed:
          return const Icon(Icons.error);
        default:
          return Container(
              decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0.r),
            border: Border.all(color: Theme.of(context).accentColor),
            color: Colors.black,
          ));
      }
    });
  }
}
