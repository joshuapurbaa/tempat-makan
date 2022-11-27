import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

import 'food_container_border.dart';

class FoodAndDrinkListView extends StatelessWidget {
  const FoodAndDrinkListView({
    Key? key,
    required this.menus,
  }) : super(key: key);

  final Menu menus;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return SizedBox(
      height: AppSize.detailFoodDrinkListViewH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food',
            style: text.headline6,
          ),
          const ResponsiveGaps(h: 10),
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
          const ResponsiveGaps(h: 20),
          Text(
            'Drink',
            style: text.headline6,
          ),
          const ResponsiveGaps(h: 10),
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
