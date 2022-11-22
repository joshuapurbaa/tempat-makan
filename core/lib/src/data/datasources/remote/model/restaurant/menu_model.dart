import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class MenuModel extends Equatable {
  final List<DrinkModel> drinks;
  final List<FoodModel> foods;

  const MenuModel({required this.drinks, required this.foods});

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
  Map<String, dynamic> toJson() => _$MenuModelToJson(this);

  Menu toEntity() {
    return Menu(
      foods: foods.map((food) => food.toEntity()).toList(),
      drinks: drinks.map((drink) => drink.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [drinks, foods];
}
