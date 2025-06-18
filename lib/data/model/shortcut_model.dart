import 'package:hive/hive.dart';
part 'shortcut_model.g.dart';

@HiveType(typeId: 2)
class ShortcutModel extends HiveObject {
  @HiveField(0)
  final String? imageUrl;
  @HiveField(1)
  final String? name;

  ShortcutModel({
    this.imageUrl,
    this.name,
  });

  factory ShortcutModel.fromJson(Map<String, dynamic> json) {
    return ShortcutModel(
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'name': name,
    };
  }
}
