import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const ContainerIcon(
              backgroundColor: AppColors.greyColor2,
              icon: Icons.arrow_back_rounded,
            ),
          ),
          const ContainerIcon(
            backgroundColor: AppColors.greyColor2,
            icon: Icons.notifications,
          ),
        ],
      ),
    );
  }
}
