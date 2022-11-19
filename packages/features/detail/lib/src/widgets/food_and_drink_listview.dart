import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'food_container_border.dart';

class FoodAndDrinkListView extends StatelessWidget {
  const FoodAndDrinkListView({
    Key? key,
    required this.menus,
  }) : super(key: key);

  final Menu menus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Gaps(h: 20),
          Expanded(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: menus.foods.length,
              itemBuilder: (context, index) {
                return DetailContainerBorder(
                  image: AppStrings.detailFood,
                  name: menus.foods[index].name,
                );
              },
            ),
          ),
          const Gaps(h: 20),
          Text(
            'Drink',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Gaps(h: 20),
          Expanded(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: menus.drinks.length,
              itemBuilder: (context, index) {
                return DetailContainerBorder(
                  image: AppStrings.detailDrink,
                  name: menus.drinks[index].name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
