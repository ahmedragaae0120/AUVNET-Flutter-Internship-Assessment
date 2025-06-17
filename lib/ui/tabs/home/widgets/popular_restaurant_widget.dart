import 'package:auvnet_task/core/utils/config.dart';
import 'package:auvnet_task/core/utils/text_style_manager.dart';
import 'package:auvnet_task/data/model/popular_restaurant_model.dart';
import 'package:flutter/material.dart';

class PopularRestaurantWidget extends StatelessWidget {
  final PopularRestaurantModel restaurants;
  const PopularRestaurantWidget({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      height: Config.screenHight! * 0.2,
      width: Config.screenWidth! * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Config.screenHight! * 0.09,
            width: Config.screenHight! * 0.1,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondary, width: 0.2),
            ),
            child: Image.network(
              restaurants.imageUrl ?? "",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 6),
          Flexible(
            fit: FlexFit.loose,
            child: Text(restaurants.name ?? "",
                overflow: TextOverflow.ellipsis, style: AppTextStyle.medium12),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.access_time, size: 12),
              const SizedBox(width: 3),
              Text(
                restaurants.deliveryTime ?? "",
                style: const TextStyle(fontSize: 11),
              ),
            ],
          )
        ],
      ),
    );
  }
}
