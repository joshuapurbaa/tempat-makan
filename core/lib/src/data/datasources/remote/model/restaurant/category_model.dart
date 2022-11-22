import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  final String name;

  const CategoryModel({required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  Category toEntity() {
    return Category(name: name);
  }

  @override
  List<Object?> get props => [name];
}
