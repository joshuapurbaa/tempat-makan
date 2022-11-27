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
    final text = Theme.of(context).textTheme;
    return ColoredBox(
      color: AppPalette.darkBlue,
      child: PaddingOnlyWithDimens(
        top: 10,
        bottom: 20,
        right: 20,
        left: 20,
        child: Row(
          children: [
            const ContainerIcon(
              backgroundColor: AppPalette.greyColor2,
              icon: Icons.location_pin,
            ),
            const ResponsiveGaps(w: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your location',
                    style: text.subtitle2?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Jakarta',
                    style: text.subtitle1?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: AppSize.size60,
              height: AppSize.size60,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.size20),
                ),
                elevation: 4,
                child: GestureDetector(
                  onTap: () => context.goNamed('profile'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.size20),
                    child: Image.asset(
                      AppStrings.homePerson,
                      package: 'home',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
