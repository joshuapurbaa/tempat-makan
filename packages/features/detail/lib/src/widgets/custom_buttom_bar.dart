import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.size70,
      child: PaddingOnlyWithDimens(
        left: 20,
        top: 10,
        right: 20,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ContainerIcon(
              backgroundColor: AppPalette.greyColor2,
              icon: Icons.favorite_rounded,
              iconColor: AppPalette.blue,
            ),
            const ResponsiveGaps(w: 20),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Text(
                  'Book Now',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
