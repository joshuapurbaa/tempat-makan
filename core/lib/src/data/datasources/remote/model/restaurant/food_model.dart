import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel extends Equatable {
  final String name;

  const FoodModel({required this.name});

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
  Map<String, dynamic> toJson() => _$FoodModelToJson(this);

  Food toEntity() {
    return Food(name: name);
  }

  @override
  List<Object?> get props => [name];
}
