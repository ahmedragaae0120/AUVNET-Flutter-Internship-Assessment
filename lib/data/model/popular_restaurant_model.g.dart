// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularRestaurantModelAdapter
    extends TypeAdapter<PopularRestaurantModel> {
  @override
  final int typeId = 3;

  @override
  PopularRestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularRestaurantModel(
      name: fields[0] as String?,
      imageUrl: fields[1] as String?,
      deliveryTime: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PopularRestaurantModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.deliveryTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularRestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
