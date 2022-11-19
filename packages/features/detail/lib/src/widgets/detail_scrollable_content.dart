import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:theme/theme.dart';

import 'food_container_border.dart';

class DetailScrollableContent extends StatelessWidget {
  const DetailScrollableContent({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.65,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Text(
                restaurant.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                restaurant.city,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const Gaps(h: 20),
              ReadMoreText(
                restaurant.description,
                style: Theme.of(context).textTheme.bodyText2,
                trimLines: 5,
                moreStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: AppColors.blue),
              ),
              const Gaps(h: 20),
              FoodAndDrinkListView(
                menus: restaurant.menus,
              ),
              const Gaps(h: 90),
            ],
          ),
        );
      },
    );
  }
}

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
