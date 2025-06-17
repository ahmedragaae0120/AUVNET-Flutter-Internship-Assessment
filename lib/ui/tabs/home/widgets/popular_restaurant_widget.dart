import 'package:flutter/material.dart';

class Restaurant {
  final String name;
  final String imageUrl;
  final String deliveryTime;

  const Restaurant({
    required this.name,
    required this.imageUrl,
    required this.deliveryTime,
  });
}

class PopularRestaurantWidget extends StatelessWidget {
  const PopularRestaurantWidget({super.key});

  final List<Restaurant> restaurants = const [
    Restaurant(
      name: 'Allo Beirut',
      imageUrl:
          'https://cdn.images.expressmenu.com/logos/ae/allo-beirut_1606812601.jpeg',
      deliveryTime: '32 mins',
    ),
    Restaurant(
      name: 'Laffah',
      imageUrl:
          'https://cdn.images.expressmenu.com/logos/ae/laffah_1606812689.jpeg',
      deliveryTime: '38 mins',
    ),
    Restaurant(
      name: 'Falafil Al Rabiah Al Khadra',
      imageUrl:
          'https://cdn.images.expressmenu.com/logos/ae/falafil_1606812755.jpeg',
      deliveryTime: '44 mins',
    ),
    Restaurant(
      name: 'Barbar',
      imageUrl:
          'https://cdn.images.expressmenu.com/logos/ae/barbar_1606812821.jpeg',
      deliveryTime: '34 mins',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: restaurants.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return SizedBox(
              width: screenWidth * 0.28, // responsive width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Image.network(
                      restaurant.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, size: 12),
                      const SizedBox(width: 3),
                      Text(
                        restaurant.deliveryTime,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
