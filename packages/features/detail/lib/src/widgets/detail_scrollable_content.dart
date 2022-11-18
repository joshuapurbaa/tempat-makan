import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:theme/theme.dart';

import 'food_container_border.dart';

class DetailScrollableContent extends StatelessWidget {
  const DetailScrollableContent({
    Key? key,
  }) : super(key: key);

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
                'Melting Pot',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Medan',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const Gaps(h: 20),
              ReadMoreText(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. ',
                style: Theme.of(context).textTheme.bodyText2,
                trimLines: 5,
                moreStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: AppColors.blue),
              ),
              const Gaps(h: 20),
              Text(
                'Food',
                style: Theme.of(context).textTheme.headline6,
              ),
              const Gaps(h: 20),
              const DetailContainerBorder(
                image: AppStrings.detailFood,
                name: 'Toastie salmon',
              ),
              const Gaps(h: 20),
              Text(
                'Drink',
                style: Theme.of(context).textTheme.headline6,
              ),
              const Gaps(h: 20),
              const DetailContainerBorder(
                image: AppStrings.detailDrink,
                name: 'Es krim',
              ),
            ],
          ),
        );
      },
    );
  }
}
