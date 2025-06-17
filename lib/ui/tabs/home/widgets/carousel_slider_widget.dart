import 'package:auvnet_task/core/utils/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;
  final int totalImages = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          CarouselSlider.builder(
            itemCount: totalImages,
            itemBuilder: (context, index, realIndex) => Image.asset(
              AssetsManager.imagesSliderImage,
              fit: BoxFit.fitWidth,
            ),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              scrollPhysics: const BouncingScrollPhysics(),
              viewportFraction: 1.1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalImages,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// SliverToBoxAdapter(
//       child: CarouselSlider.builder(
//           itemCount: 4,
//           itemBuilder: (context, index, realIndex) => Image.asset(
//                 AssetsManager.imagesSliderImage,
//               ),
//           options: CarouselOptions(
//             autoPlay: true,
//             autoPlayAnimationDuration: const Duration(seconds: 2),
//             scrollPhysics: const BouncingScrollPhysics(),
//             viewportFraction: 1.1,
//           )),
//     );
