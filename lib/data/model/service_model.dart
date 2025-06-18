import 'package:hive/hive.dart';
part 'service_model.g.dart';

@HiveType(typeId: 1)
class ServiceModel extends HiveObject {
  @HiveField(0)
  final String? imageUrl;
  @HiveField(1)
  final String? deliveryTime;
  @HiveField(2)
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
