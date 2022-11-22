import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel extends Equatable {
  final String name;

  const DrinkModel({required this.name});

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);

  Drink toEntity() {
    return Drink(name: name);
  }

  @override
  List<Object?> get props => [name];
}
