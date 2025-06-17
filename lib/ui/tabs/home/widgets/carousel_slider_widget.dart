import 'package:auvnet_task/core/utils/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> sliderImages;
  const CarouselSliderWidget({
    super.key,
    required this.sliderImages,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
          itemCount: sliderImages.length,
          itemBuilder: (context, index, realIndex) => CachedNetworkImage(
                imageUrl: sliderImages[index] ?? "",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Skeletonizer(
                  enabled: true,
                  child: Container(
                    color: const Color.fromARGB(131, 158, 158, 158),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(AssetsManager.imagesNotFoundImage),
              ),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            scrollPhysics: const BouncingScrollPhysics(),
            viewportFraction: 1.1,
          )),
    );
  }
}
