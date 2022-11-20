import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.space20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const ContainerIcon(
              backgroundColor: AppPalette.greyColor2,
              icon: Icons.arrow_back_rounded,
            ),
          ),
          const ContainerIcon(
            backgroundColor: AppPalette.greyColor2,
            icon: Icons.notifications,
          ),
        ],
      ),
    );
  }
}
