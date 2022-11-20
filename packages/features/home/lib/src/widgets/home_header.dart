import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resources/resources.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const GapsWithDimens(w: 20),
        const ContainerIcon(
          backgroundColor: AppPalette.greyColor2,
          icon: Icons.location_pin,
        ),
        const GapsWithDimens(w: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your location',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                'Jakarta',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        SizedBox(
          width: AppDimens.space70,
          height: AppDimens.space70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.space20),
            child: GestureDetector(
              onTap: () => context.goNamed('profile'),
              child: Image.asset(
                AppStrings.homePerson,
                package: 'home',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const GapsWithDimens(w: 20),
      ],
    );
  }
}
