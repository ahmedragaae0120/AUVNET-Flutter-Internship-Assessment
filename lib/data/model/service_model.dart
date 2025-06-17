class ServiceModel {
  final String? imageUrl;
  final String? deliveryTime;
  final String? name;

  ServiceModel({
    this.imageUrl,
    this.deliveryTime,
    this.name,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      imageUrl: json['image_url'] as String?,
      deliveryTime: json['delivery_time'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'delivery_time': deliveryTime,
      'name': name,
    };
  }
}
