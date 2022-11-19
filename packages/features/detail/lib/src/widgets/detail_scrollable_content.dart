import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'food_and_drink_listview.dart';

class DetailScrollableContent extends StatelessWidget {
  const DetailScrollableContent({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final RestaurantDetail detail;

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
                detail.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                detail.city,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const Gaps(h: 20),
              ReadMoreText(
                detail.description,
                style: Theme.of(context).textTheme.bodyText2,
                trimLines: 5,
                moreStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: AppColors.blue),
              ),
              const Gaps(h: 20),
              FoodAndDrinkListView(
                menus: detail.menus,
              ),
              const Gaps(h: 90),
            ],
          ),
        );
      },
    );
  }
}
