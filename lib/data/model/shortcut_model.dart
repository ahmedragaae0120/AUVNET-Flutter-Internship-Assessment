class ShortcutModel {
  final String? imageUrl;
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
