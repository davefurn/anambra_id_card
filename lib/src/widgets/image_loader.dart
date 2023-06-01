import 'package:acmc/src/constants/colors.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoader extends StatefulWidget {
  final String image;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? boxFit;
  final Function()? onTap;
  final bool isPlaceHolder;
  const ImageLoader({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.boxFit,
    this.radius,
    this.onTap,
    this.isPlaceHolder = false,
  }) : super(key: key);

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.image.isEmpty
        ? const Icon(Icons.person)
        : ExtendedImage.network(
            widget.image,
            fit: BoxFit.fill,
            borderRadius: BorderRadius.circular(8),
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Shimmer.fromColors(
                      baseColor: IdColors.mainColor,
                      highlightColor: IdColors.anotherWhite,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Image.asset(
                          'assets/images/splash.png',
                        ),
                      ),
                    ),
                  );
                case LoadState.completed:
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                    child: ExtendedRawImage(
                      image: state.extendedImageInfo?.image,
                      fit: widget.boxFit,
                    ),
                  );
                case LoadState.failed:
                  return GestureDetector(
                    child: const Center(
                      child: Icon(
                        Icons.replay_outlined,
                        color: IdColors.anotherWhite,
                        size: 60,
                      ),
                    ),
                    onTap: () {
                      state.reLoadImage();
                    },
                  );
              }
            },
          );
  }

  @override
  bool get wantKeepAlive => true;
}
