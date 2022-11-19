import 'package:equatable/equatable.dart';

import 'drink.dart';
import 'food.dart';

class Menu extends Equatable {
  final List<Food> foods;
  final List<Drink> drinks;

  const Menu({required this.foods, required this.drinks});
  @override
  List<Object?> get props => [foods, drinks];
}
