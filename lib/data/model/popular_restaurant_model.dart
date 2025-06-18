import 'package:hive/hive.dart';
part 'popular_restaurant_model.g.dart';

@HiveType(typeId: 3)
class PopularRestaurantModel extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String? deliveryTime;

  PopularRestaurantModel({
    this.name,
    this.imageUrl,
    this.deliveryTime,
  });

  factory PopularRestaurantModel.fromJson(Map<String, dynamic> json) {
    return PopularRestaurantModel(
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      deliveryTime: json['delivery_time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image_url': imageUrl,
      'delivery_time': deliveryTime,
    };
  }
}
