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
            height: AppDimens.cardHomeH,
            child: Card(
              margin: EdgeInsets.all(AppDimens.space20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.space20),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.space20),
                    child: Image.network(
                      '${AppStrings.smallImageUrl}${restaurant.pictureId}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: AppDimens.space60,
                      padding: EdgeInsets.only(
                        left: AppDimens.space20,
                        top: AppDimens.space10,
                        right: AppDimens.space20,
                      ),
                      decoration: BoxDecoration(
                        color: AppPalette.whiteColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(AppDimens.space20),
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
