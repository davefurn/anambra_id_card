import 'package:acmc/src/constants/colors.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ImageLoader extends StatefulWidget {
  final String image;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? boxFit;
  final Function()? onTap;
  final bool isPlaceHolder;
  final bool isCircle;
  final Object? heroTag;
  final bool tap;
  const ImageLoader({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.boxFit,
    this.radius,
    this.onTap,
    this.isPlaceHolder = false,
    this.isCircle = false,
    this.heroTag,
    this.tap = true,
  }) : super(key: key);

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.image.split('/').last.isEmpty
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey.withOpacity(0.4),
            ),
            child: const Icon(
              Icons.person,
              size: 100,
            ),
          )
        : ExtendedImage.network(
            widget.image,
            fit: BoxFit.fill,
            width: widget.width,
            height: widget.height,
            shape: widget.isCircle ? BoxShape.circle : null,
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
                  return GestureDetector(
                    onTap: () {
                      if (widget.tap) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(),
                              body: Center(
                                child: Zoom(
                                  initTotalZoomOut: true,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: ImageLoader(
                                    image: widget.image,
                                    radius: 0,
                                    tap: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(widget.radius ?? 10.r),
                      child: Builder(builder: (context) {
                        return ExtendedRawImage(
                          image: state.extendedImageInfo?.image,
                          fit: widget.boxFit,
                          width: widget.width,
                          height: widget.height,
                        );
                      }),
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
