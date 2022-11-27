import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resources/resources.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.goNamed('search');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.size15),
            child: ColoredBox(
              color: AppPalette.greyColor2,
              child: PaddingOnlyWithDimens(
                left: 15,
                top: 10,
                bottom: 10,
                right: 70,
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_rounded,
                      color: AppPalette.darkBlue,
                    ),
                    const ResponsiveGaps(w: 10),
                    Text(
                      'Cari tempat makan',
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Icon(
          Icons.email_rounded,
          size: AppSize.size30,
        ),
        const ResponsiveGaps(w: 20),
        Icon(
          Icons.notifications,
          size: AppSize.size30,
        )
      ],
    );
  }
}
