class PopularRestaurantModel {
  final String? name;
  final String? imageUrl;
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
