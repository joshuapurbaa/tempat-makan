import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resources/resources.dart';

class CardHome extends StatelessWidget {
  const CardHome({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListView.builder(
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
          child: SizedBox(
            height: AppSize.cardHomeH,
            child: Card(
              margin: EdgeInsets.all(AppSize.size20),
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
                      height: AppSize.size60,
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
                                  const GapsWithDimens(w: 5),
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
          ),
        );
      },
    );
  }
}
