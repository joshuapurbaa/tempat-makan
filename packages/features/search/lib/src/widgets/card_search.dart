import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:resources/resources.dart';

class CardSearch extends StatelessWidget {
  const CardSearch({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return GestureDetector(
          onTap: () {
            context.goNamed(
              'detail',
              params: {
                'id': restaurant.id,
              },
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.size20),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.size20),
                  child: Image.network(
                    '${AppStrings.smallImageUrl}${restaurant.pictureId}',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: AppSize.size70,
                    padding: EdgeInsets.only(
                      left: AppSize.size20,
                      top: AppSize.size10,
                      right: AppSize.size20,
                    ),
                    decoration: BoxDecoration(
                      color: AppPalette.whiteColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(AppSize.size20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: text.subtitle1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              restaurant.city,
                              style: text.subtitle2,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.orange,
                                ),
                                const ResponsiveGaps(w: 5),
                                Text(
                                  restaurant.rating.toString(),
                                  style: text.subtitle1,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
